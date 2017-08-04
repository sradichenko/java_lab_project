package stubs;

import db.service.InvoiceService;
import db.service.TicketService;
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

//Заглушка для страницы корзины
@WebServlet(urlPatterns = {"/ticketsPrint"})
public class StubTicketPrintServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResourceBundle err = (ResourceBundle) getServletContext().getAttribute("errors");
        HttpSession httpSession = request.getSession();
        Cookie[] cookies = request.getCookies();
        SessionUtils.checkCookie(cookies, request, httpSession);
        User user = (User) httpSession.getAttribute("user");

        if (user == null) {
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }

        InvoiceService invoiceService = new InvoiceService();
        TicketService ticketService = new TicketService();

        httpSession.setAttribute("lastServletPath", request.getServletPath());

        List<Invoice> invoicesForJSP = new ArrayList<>();
        List<Invoice> allPayedInvoices=invoiceService.getAllInvoicesByUserAndStatus(user.getUserId(), Invoice.InvoiceStatus.PAYED);
        if(!allPayedInvoices.isEmpty()) {
            List<Ticket> ticketsForPayedInvoice;
            for (Invoice invoice : allPayedInvoices) {
                ticketsForPayedInvoice = ticketService.getTicketsByInvoice(invoice.getInvoiceId());
                invoice.setTickets(ticketsForPayedInvoice);
                invoicesForJSP.add(invoice);
            }
            request.setAttribute("invoices", invoicesForJSP);
        }
        else{
            request.setAttribute("noPayedInvoices",err.getString("noPayedInvoices"));
        }
        request.getRequestDispatcher("/WEB-INF/pages/ticketPrints.jsp").forward(request, response);

}
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
