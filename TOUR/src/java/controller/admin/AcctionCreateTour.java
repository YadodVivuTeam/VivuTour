/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAO.ActivityTourDAO;
import DAO.CityDAO;
import DAO.HotelDAO;
import DAO.TourDAO;
import DAO.TypeDAO;
import entities.Activiti;
import entities.City;
import entities.Hotel;
import entities.Tour;
import entities.Type;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

/**
 *
 * @author MienTrungComputer
 */
@WebServlet(name = "AcctionCreateTour", urlPatterns = {"/admin/acctionCreateTour"})
public class AcctionCreateTour extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        ActivityTourDAO dao1 = new ActivityTourDAO();
        CityDAO cDAO = new CityDAO();
        HotelDAO hDAO = new HotelDAO();
        TypeDAO tyDAO = new TypeDAO();
        List<Hotel> hotel = new ArrayList<>();
        List<Type> type = tyDAO.getAllType();
        List<City> city = cDAO.getAllCity();
        if (id != null) {
            hotel = hDAO.getHotelsByCityID(Integer.parseInt(id));
        }
        List<Activiti> activity = dao1.loadAllActivityTour();
        request.setAttribute("type", type);
        request.setAttribute("city", city);
        request.setAttribute("hotel", hotel);
        request.setAttribute("selectedCityID", id);
        request.setAttribute("listActivity", activity);
        request.getRequestDispatcher("createTour.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TourDAO dao = new TourDAO();
        ActivityTourDAO activityTourDAO = new ActivityTourDAO();
        
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        int hotel = Integer.parseInt(request.getParameter("hotel_ID"));
        int city_ID = Integer.parseInt(request.getParameter("city_ID"));
        int Type_name = Integer.parseInt(request.getParameter("Type_ID"));
        int numberPeople = Integer.parseInt(request.getParameter("numberPeople"));
        String img = request.getParameter("img");
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        String content = request.getParameter("content");
        String tourName = request.getParameter("tourName");
        
        String[] activityIDs = request.getParameterValues("activityID");
        
        //Tour tour = new Tour( startDate, endDate, hotel, city_ID, numberPeople, content, img, totalPrice, isDelete, Type_name);
        Tour t = new Tour();
        t.setStartDate(startDate);
        t.setEndDate(endDate);
        t.setCity_ID(city_ID);
        t.setHotel_ID(hotel);
        t.setTotalPrice(totalPrice);
        t.setImg(img);
        t.setIsDelete(false);
        t.setType_name(Type_name);
        t.setNumberPeople(numberPeople);
        t.setContent(content);
        t.setTourName(tourName);
        dao.insertTour(t);
        
        int tourID = dao.getLastestTourId();
        if(tourID == 0){
            //cho chuyen sang trang loi
            throw new IllegalArgumentException("Can not find tour id!!!");
        }
        
        Stream.of(activityIDs).forEach((String activityId) -> {
            String time = "12:00"; // tao khong biet cai time nay lay o dau
            activityTourDAO.creatTourActivity(tourID, activityId, time);
        });
        
        response.sendRedirect("getTour");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
}
