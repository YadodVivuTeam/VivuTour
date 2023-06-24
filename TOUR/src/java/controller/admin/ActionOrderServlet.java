/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAO.OrderDAO;
import DAO.TickerDAO;
import DAO.TourDAO;
import DAO.UserDAO;
import controller.sendMail.CodeRandom;
import controller.sendMail.EmailConfig;
import entities.Order;
import entities.Ticket;
import entities.Tour;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;

/**
 *
 * @author tungl
 */
@WebServlet(name = "ActionOrderServlet", urlPatterns = {"/admin/ActionOrder"})
public class ActionOrderServlet extends HttpServlet {
    EmailConfig e = new EmailConfig();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        OrderDAO oDAO = new OrderDAO();
        int status = Integer.parseInt(request.getParameter("status"));
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        if (action != null) {
            if (action.equalsIgnoreCase("Accept")) {
                if (status == 0) {
                    //Send mail ticket and add ticket
                    Order o = oDAO.getOrderByID(orderID);
                    UserDAO uDAO = new UserDAO();
                    TourDAO tDAO = new TourDAO();
                    Tour t = tDAO.getTourByID(o.getTourId());
                    User user = uDAO.searchUser("UserID", o.getUserId()+"");
                    CodeRandom code = new CodeRandom();
                    String codeTicket = code.generateTicketCode();
                    String to = user.getEmail();
                    String subject = "Ticket Tour";
                    String message = "Ticket code's: " + codeTicket;
                    try {
                        e.SendEmail(to, subject, message);
                    } catch (MessagingException ex) {
                        Logger.getLogger(ActionOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    TickerDAO tkDAO = new TickerDAO();
                    Ticket ticket = new Ticket();
                    ticket.setCode(codeTicket);
                    ticket.setName(t.getTourName());
                    ticket.setUserID(user.getUserID());
                    ticket.setTourID(o.getTourId());
                    
                    tkDAO.insertTicket(ticket);
                    oDAO.updateOrderStatus(orderID, 1);
                }
                if (status == 2) {
                    oDAO.updateOrderStatus(orderID, 3);
                }
            }
            if (action.equalsIgnoreCase("Cancel")) {
                oDAO.updateOrderStatus(orderID, 4);
            }
        }
        response.sendRedirect("getOrder");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
