package controller;

import db.services.interfaces.InvoiceService;
import db.services.interfaces.TicketService;
import db.services.servicesimpl.InvoiceServiceImpl;
import db.services.servicesimpl.TicketServiceImpl;
import pojo.Invoice;
import pojo.Ticket;
import pojo.User;
import utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

@WebServlet(urlPatterns = {"/ticketsPrint"})
public class TicketPrintServlet extends HttpServlet {
    private static InvoiceService is = new InvoiceServiceImpl();
    private static TicketService ts = new TicketServiceImpl();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResourceBundle err = (ResourceBundle) getServletContext().getAttribute("errors");
        HttpSession httpSession = request.getSession();
        Cookie[] cookies = request.getCookies();
        SessionUtils.checkCookie(cookies, request, httpSession);
        User user = (User) httpSession.getAttribute("user");
        httpSession.setAttribute("lastServletPath", request.getServletPath());

        if (user == null) {
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }

        List<Invoice> allPayedInvoices = is.getAllInvoicesByUserAndStatus(user.getUserId(), Invoice.InvoiceStatus.PAYED);
        List<Invoice> invoicesSortedForPrint = new ArrayList<>();
        if (!allPayedInvoices.isEmpty()) {
            List<Ticket> ticketsForPayedInvoice;
            for (Invoice invoice : allPayedInvoices) {
                ticketsForPayedInvoice = ts.getTicketsByInvoice(invoice.getInvoiceId());
                invoice.setTickets(ticketsForPayedInvoice);
                invoicesSortedForPrint.add(invoice);
            }
            request.setAttribute("invoices", invoicesSortedForPrint);
        } else {
            request.setAttribute("noPayedInvoices", err.getString("noPayedInvoices"));
        }
        request.getRequestDispatcher("/WEB-INF/pages/ticketPrints.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
