/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.*;
import entities.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author tungl
 */
@WebServlet(name = "TourDetailServlet", urlPatterns = {"/TourDetail"})
public class TourDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        TourDAO dao = new TourDAO();
        ActivityTourDAO tDao = new ActivityTourDAO();

        List<Activiti> lt = tDao.loadAllActivityTourByTourID(id_raw);

        List<Tour> list = dao.getAllTours();
        CityDAO cDao = new CityDAO();
        HotelDAO hDAO = new HotelDAO();
        FeedbackDAO fDAO = new FeedbackDAO();
        UserDAO uDAO = new UserDAO();

        request.setAttribute("listF", fDAO.getFeedback(Integer.parseInt(id_raw)));
        request.setAttribute("uDAO", uDAO);
        request.setAttribute("hDAO", hDAO);
        request.setAttribute("cDAO", cDao);
        request.setAttribute("tour", list);
        request.setAttribute("tour", list);
        request.setAttribute("id", id_raw);
        request.setAttribute("t", dao.getTourByID(Integer.parseInt(id_raw)));
        request.setAttribute("lat", lt);
        request.getRequestDispatcher("tourDetail.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
