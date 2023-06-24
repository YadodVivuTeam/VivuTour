/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAO.ActivityTourDAO;
import DAO.HotelDAO;
import DAO.TourDAO;
import DAO.TypeDAO;
import entities.Activiti;
import entities.Hotel;
import entities.Tour;
import entities.Type;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author MienTrungComputer
 */
@WebServlet(name = "TourDetail", urlPatterns = {"/admin/tourDetail"})
public class TourDetail extends HttpServlet {

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
        TourDAO dao = new TourDAO();
        ActivityTourDAO dao1 = new ActivityTourDAO();
        HotelDAO dao2 = new HotelDAO();
        TypeDAO dao3 = new TypeDAO();

        String id = request.getParameter("tour_ID");
        Tour tour = dao.getTourByID(Integer.parseInt(id));
        List<Activiti> activiti = dao1.loadAllActivityTourByTourID(id);
        Hotel city = dao2.getHotelByID(tour.getHotel_ID());
        List<Hotel> hotel = dao2.getHotelsByCityID(city.getCityID());
        List<Type> type = dao3.getAllType();

        request.setAttribute("tourDetail", tour);
        request.setAttribute("listActivity", activiti);
        request.setAttribute("city", city);
        request.setAttribute("hotel", hotel);
        request.setAttribute("type", type);
        request.getRequestDispatcher("tourDetail.jsp").forward(request, response);
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
        ActivityTourDAO dao1 = new ActivityTourDAO();
        int id = Integer.parseInt(request.getParameter("tour_ID"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        int hotel = Integer.parseInt(request.getParameter("hotel_ID"));
        int Type_name = Integer.parseInt(request.getParameter("Type_ID"));
        int numberPeople = Integer.parseInt(request.getParameter("numberPeople"));
        String img = request.getParameter("img");
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        String content = request.getParameter("content");
        boolean isDelete = Boolean.parseBoolean(request.getParameter("isDelete"));
        String[] activityID = request.getParameterValues("activity");
        List<Activiti> listActivity = dao1.loadAllActivityTourByTourID(id + "");
        String tourName = request.getParameter("tourName");
        boolean isActive = false;
        for (int i = 0; i < listActivity.size(); i++) {
            isActive = false;
            for (String aID : activityID) {
                if (aID.equals(listActivity.get(i).getActivity_ID() + "")) {
                    isActive = true;
                }
            }
            listActivity.get(i).setIsActive(isActive);
        }

        listActivity.stream().forEach(a -> {
            dao1.updateActivity(id, a.getActivity_ID(), a.isIsActive());
        });
        dao.updateTourByID(startDate, endDate, numberPeople, content, img, totalPrice, isDelete, Type_name, hotel, tourName, id);
        response.sendRedirect("getTour");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
