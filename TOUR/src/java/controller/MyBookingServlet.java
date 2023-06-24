/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import entities.*;
import DAO.*;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author tungl
 */
@WebServlet(name = "MyBookingServlet", urlPatterns = {"/MyBooking"})
public class MyBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        if (u == null) {
            request.setAttribute("showModalJS_login", true);
            request.getRequestDispatcher("myBooking.jsp").forward(request, response);
        } else {
            OrderDAO dao = new OrderDAO();
            TourDAO tDao = new TourDAO();
            CityDAO ciDAO = new CityDAO();
//            ciDAO.getCityByID(tDao.getTourByID(0))
            request.setAttribute("o", dao.getToursByUserID(u.getUserID()));
            request.setAttribute("ciDao", ciDAO);
            request.setAttribute("tDao", tDao);
            request.getRequestDispatcher("myBooking.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    public static String getCurrentDateTime() {
        // Get the current date and time
        LocalDateTime currentDateTime = LocalDateTime.now();

        // Define the desired format for date and time
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy | HH:mm:ss");

        // Format the current date and time using the defined format
        String formattedDateTime = currentDateTime.format(formatter);

        // Return the formatted current date and time
        return formattedDateTime;
    }

}
