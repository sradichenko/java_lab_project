package stubs;

import db.service.InvoiceService;
import pojo.Invoice;
import pojo.User;
import utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Optional;
import java.util.ResourceBundle;

//Заглушка для страницы оплаты

@WebServlet(urlPatterns = {"/ticketPay"})
public class StubPayedServlet extends HttpServlet {
    private static InvoiceService is = new InvoiceService();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResourceBundle err = (ResourceBundle) getServletContext().getAttribute("errors");
        HttpSession httpSession = request.getSession();
        Cookie[] cookies = request.getCookies();
        SessionUtils.checkCookie(cookies, request, httpSession);

        User user = (User) httpSession.getAttribute("user");

        Optional<Invoice> invoiceOptional = is.getInvoiceByUser(user.getUserId(),
                Invoice.InvoiceStatus.CREATED);

        String[] ticketsIds = (String[]) httpSession.getAttribute("ticketsArray");
        String[] passengerNames = (String[]) httpSession.getAttribute("passengersArray");
        String[] passports = (String[]) httpSession.getAttribute("passportsArray");

        if (StubUtils.checkEmptyAndSaveForPay(ticketsIds, passengerNames, passports)) {
            request.setAttribute("setFields", err.getString("setFields"));
            request.getRequestDispatcher("/bucket").forward(request, response);
        } else if (invoiceOptional.isPresent()) {
            Invoice invoice = invoiceOptional.get();
            invoice.setInvoiceStatus(Invoice.InvoiceStatus.PAYED);
            is.update(invoice);
            int ticketsInBucket = StubUtils.getNumberOfTicketsInInvoice(user);
            httpSession.setAttribute("ticketsInBucket", ticketsInBucket);
            httpSession.setAttribute("invoiceView", null);
            request.getRequestDispatcher("/WEB-INF/pages/invoiceSuccess.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/bucket").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
