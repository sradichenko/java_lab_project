package controller;

import db.services.interfaces.FlightPlaceService;
import db.services.interfaces.FlightService;
import db.services.interfaces.InvoiceService;
import db.services.interfaces.TicketService;
import db.services.servicesimpl.FlightPlaceServiceImpl;
import db.services.servicesimpl.FlightServiceImpl;
import db.services.servicesimpl.InvoiceServiceImpl;
import db.services.servicesimpl.TicketServiceImpl;
import org.apache.log4j.Logger;
import pojo.Flight;
import pojo.Invoice;
import pojo.Ticket;
import pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Optional;
import java.util.ResourceBundle;

/**
 * Servlet for add ticket to user cart (invoice)
 */
@WebServlet(urlPatterns = {"/addFlightToInvoice"})
public class InvoiceServlet extends HttpServlet {
    private static Logger log = Logger.getLogger("servletLogger");
    private static FlightService flightService;
    private static InvoiceService invoiceService;
    private static TicketService ticketService;
    private static FlightPlaceService flightPlaceService;

    public void init() {
        log.info("init(): Initializing 'flightService', 'invoiceService', 'ticketService' and 'flightPlaceService'.");
        flightService = FlightServiceImpl.getInstance();
        invoiceService = InvoiceServiceImpl.getInstance();
        ticketService = TicketServiceImpl.getInstance();
        flightPlaceService = FlightPlaceServiceImpl.getInstance();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.info("doGet(request, response): Received the following 'request' = " + request.getQueryString() + ", 'response' = " + response.getStatus());
        ResourceBundle err = (ResourceBundle) getServletContext().getAttribute("errors");

        HttpSession httpSession = request.getSession();
        User user = (User) httpSession.getAttribute("user");

        String dateFromString = (String) httpSession.getAttribute("dateFrom");
        String dateToString = (String) httpSession.getAttribute("dateTo");
        String departure = (String) httpSession.getAttribute("departureF");
        String arrival = (String) httpSession.getAttribute("arrivalF");
        String numberTicketsFilterString = (String) httpSession.getAttribute("numberTicketsFilter");
        String[] checkBox = (String[]) httpSession.getAttribute("business");
        String redirectBackString = getRedirectBackString(dateFromString, dateToString, departure,
                arrival, numberTicketsFilterString, checkBox);

        String numberTicketsFlightString = request.getParameter("numberTicketsFlight");
        int numberTicketsFlight = Integer.parseInt(numberTicketsFlightString);

        int pageNum = (int) httpSession.getAttribute("pageLast");
        httpSession.setAttribute("pageToLoad", pageNum);

        // get flight id and get Flight to add  tickets for it in invoice
        String flightIdString = request.getParameter("flightId");
        Flight flight = null;
        log.info("doGet(request, response): Initializing 'flightOptional' by 'flightId'.");
        Optional<Flight> flightOptional = flightService.get(Long.parseLong(flightIdString));
        if (flightOptional.isPresent()) {
            flight = flightOptional.get();
        }

        // check if ticket is business or econom and get available places in flight for class
        String[] checkbox = (String[]) httpSession.getAttribute("business");
        boolean business = false;
        int availableForClass = flight.getAvailablePlacesEconom();

        if (checkbox != null) {
            if (checkbox[0].equals("business")) {
                business = true;
                availableForClass = flight.getAvailablePlacesBusiness();
            }
        }

        log.info("doGet(request, response): Executing getInvoiceForUser().");
        Invoice invoice = getInvoiceForUser(request, response, err, user,
                redirectBackString, numberTicketsFlight, availableForClass);

        //if number of needed Ticket is not zero, start to create ticket
        log.info("doGet(request, response): Checking if numberTicketsFlight != 0.");
        if (numberTicketsFlight != 0) {
            if (createTicketsForInvoice(request, response, err, httpSession, user, redirectBackString,
                    numberTicketsFlight, flight, business, invoice))
                return;
        }
        log.info("doGet(request, response): Executing response.sendRedirect(redirectBackString).");
        response.sendRedirect(redirectBackString);
    }

    private boolean createTicketsForInvoice(HttpServletRequest request, HttpServletResponse response, ResourceBundle err, HttpSession httpSession, User user, String redirectBackString, int numberTicketsFlight, Flight flight, boolean business, Invoice invoice) throws ServletException, IOException {
        for (int i = 0; i < numberTicketsFlight; i++) {
            //request for available places in flight and reserve them in inner method
            int sittingPlace = flightPlaceService.getRandomSittingPlace(flight.getFlightId(), business);
            // if available place is 0 in random, create notification, it means here aren't available places
            if (sittingPlace == 0) {
                log.info("doGet(request, response): Not enough places!");
                request.setAttribute("notEnoughPlaces", err.getString("notEnoughPlaces"));
                request.getRequestDispatcher(redirectBackString).forward(request, response);
                return true;
            }
            // if sitting place is reserved in flight, create new Ticket in DB with parameters set by user in filters
            Ticket ticket = new Ticket(invoice, flight, "", "", sittingPlace,
                    false, business, (double) httpSession.getAttribute("ticketCost"));//price not from getBaseCost)() but from attribute
            ticketService.add(ticket);
            log.info("doGet(request, response): Adding a new ticket to DB: " + ticket);
            httpSession.setAttribute("boughtFlightId", flight.getFlightId());
        }
        int ticketsInBucket = invoiceService.getNumberOfTicketsInInvoice(user);
        httpSession.setAttribute("ticketsInBucket", ticketsInBucket);
        return false;
    }

    /**
     * Create back string with which user will be returning for his filters in search
     *
     * @param dateFromString            http session attribute
     * @param dateToString              http session attribute
     * @param departure                 http session attribute
     * @param arrival                   http session attribute
     * @param numberTicketsFilterString http session attribute
     * @param checkBox                  http session attribute
     * @return ready string to servlet path
     */

    private String getRedirectBackString(String dateFromString, String dateToString, String departure, String arrival, String numberTicketsFilterString, String[] checkBox) {
        log.info("doGet(request, response): Initializing redirectBackStringBuilder.");
        StringBuilder redirectBackStringBuilder = new StringBuilder();
        redirectBackStringBuilder.append("/doSearch?dateFrom=").append(dateFromString).append("&dateTo=").
                append(dateToString).append("&selectedDeparture=").append(departure).append("&selectedArrival=").
                append(arrival).append("&numberTicketsFilter=").append(numberTicketsFilterString);
        if (checkBox != null) {
            redirectBackStringBuilder.append("&box=").append(checkBox[0]);
        }
        return redirectBackStringBuilder.toString();
    }

    /**
     *
     * @param request from user
     * @param response to user
     * @param err locale of errors
     * @param user current user
     * @param redirectBackString created backString for return if something gone wrong
     * @param numberTicketsFlight to reserve
     * @param availableForClass available for this class amount of tickets
     * @return checked Invoice
     * @throws ServletException for request Dispatcher
     * @throws IOException for request Dispatcher
     */
    private Invoice getInvoiceForUser(HttpServletRequest request, HttpServletResponse response, ResourceBundle err, User user,
                                      String redirectBackString, int numberTicketsFlight, int availableForClass)
            throws ServletException, IOException {
        log.info("doGet(request, response): Received the following 'request' = " + request.getQueryString() +
                ", 'response' = " + response.getStatus() +
                ", 'err' = " + err +
                ", 'user' = " + user +
                ", 'redirectBackString' = " + redirectBackString +
                ", 'numberTicketsFlight' = " + numberTicketsFlight +
                ", 'availableForClass' = " + availableForClass
        );
        Invoice invoice;
        if (numberTicketsFlight > availableForClass) {
            request.setAttribute("notEnoughPlaces", err.getString("notEnoughPlaces"));
            request.getRequestDispatcher(redirectBackString).forward(request, response);
        } else {
            //check if invoice already created in status Created for this user
            log.info("doGet(request, response): Initializing 'invoiceOptional' by user ID.");
            Optional<Invoice> invoiceOptional = invoiceService.getInvoiceByUser(user.getUserId(),
                    Invoice.InvoiceStatus.CREATED);
            if (invoiceOptional.isPresent()) {
                invoice = invoiceOptional.get();
            } else {
                //if invoice isn't created, add it
                log.info("doGet(request, response): Adding new invoice.");
                invoice = new Invoice(user, Invoice.InvoiceStatus.CREATED, LocalDateTime.now());
                invoiceService.add(invoice);
            }
        }
        log.info("doGet(request, response): Getting invoice by user and returning it.");
        invoice = invoiceService.getInvoiceByUser(user.getUserId(), Invoice.InvoiceStatus.CREATED).orElse(null);
        return invoice;
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log.info("doPost(request, response): Received the following 'request' = " + request.getQueryString() + ", 'response' = " + response.getStatus());
        doGet(request, response);
    }
}
