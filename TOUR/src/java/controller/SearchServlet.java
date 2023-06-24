/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CityDAO;
import DAO.HotelDAO;
import DAO.TourDAO;
import entities.Tour;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tungl
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/searchTour"})
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TourDAO dao = new TourDAO();
        List<Tour> list = new ArrayList<>();
        HttpSession session = request.getSession();
        session.setAttribute("mess", null);

        list = dao.getAllTours();
        CityDAO cDao = new CityDAO();
        HotelDAO hDAO = new HotelDAO();
        
        request.setAttribute("cityList", cDao.getAllCity());
        request.setAttribute("hDAO", hDAO);
        request.setAttribute("cDAO", cDao);
        request.setAttribute("tour", list);
        request.setAttribute("cityList", cDao.getAllCity());
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TourDAO tDAO = new TourDAO();
        CityDAO cDao = new CityDAO();
        TourDAO dao = new TourDAO();
        List<Tour> list = new ArrayList<>();
        HttpSession session = request.getSession();
        session.setAttribute("mess", null);

        list = dao.getAllTours();
        HotelDAO hDAO = new HotelDAO();
        
        request.setAttribute("cityList", cDao.getAllCity());
        request.setAttribute("hDAO", hDAO);
        request.setAttribute("cDAO", cDao);
        request.setAttribute("tour", list);
        String date = request.getParameter("startDate");
        String to = request.getParameter("to");
        request.setAttribute("tour", tDAO.searchTourByCity(to, date));
        request.setAttribute("cityList", cDao.getAllCity());
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

}
