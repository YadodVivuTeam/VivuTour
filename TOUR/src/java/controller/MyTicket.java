/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.TickerDAO;
import DAO.TourDAO;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author tungl
 */
@WebServlet(name = "MyTicket", urlPatterns = {"/MyTicket"})
public class MyTicket extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TickerDAO tkDAO = new TickerDAO();
        TourDAO tDAO = new TourDAO();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        request.setAttribute("tDAO", tDAO);
        request.setAttribute("o", tkDAO.getAllTicketByUser(u.getUserID()));
        request.getRequestDispatcher("myTicket.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
