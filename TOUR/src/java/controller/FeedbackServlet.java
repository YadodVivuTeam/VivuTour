/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.FeedbackDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author tungl
 */
@WebServlet(name = "FeedbackServlet", urlPatterns = {"/Feedback"})
public class FeedbackServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int tourID = Integer.parseInt(request.getParameter("tourID"));
        String userID = request.getParameter("userID");
        String rate = request.getParameter("rating");
        String context = request.getParameter("context");
        FeedbackDAO fDAO = new FeedbackDAO();
        fDAO.addComment(tourID, Integer.parseInt(userID), context, Integer.parseInt(rate));
        response.getWriter().print(tourID+"|"+userID+"|"+context+rate);
        response.sendRedirect("TourDetail?id="+tourID);
    }

}
