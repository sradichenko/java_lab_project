package controller;

import db.service.TicketService;
import pojo.Ticket;
import pojo.User;
import utils.ServletUtils;
import utils.SessionUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@WebServlet(urlPatterns = {"/ticketDelete"})
public class DeleteTicketServlet extends HttpServlet {
    private static TicketService ts = new TicketService();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        Cookie[] cookies = request.getCookies();
        SessionUtils.checkCookie(cookies, request, httpSession);
        User user = (User) httpSession.getAttribute("user");

        if (user == null) {
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
        String ticketId = request.getParameter("ticketId");
        Optional<Ticket> ticketOptional = ts.get(Long.parseLong(ticketId));
        if (ticketOptional.isPresent()) {
            Ticket ticket = ticketOptional.get();
            List<Ticket> tickets = new ArrayList<>();
            tickets.add(ticket);
            ServletUtils.revertSittingPlaces(tickets);
            int ticketsInBucket = ServletUtils.getNumberOfTicketsInInvoice(user);
            httpSession.setAttribute("ticketsInBucket", ticketsInBucket);
        }
        String redirectBackString = "/bucket";
        response.sendRedirect(redirectBackString);
    }
}