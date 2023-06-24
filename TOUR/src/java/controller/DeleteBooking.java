/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.OrderDAO;
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
@WebServlet(name = "DeleteBooking", urlPatterns = {"/DeleteBooking"})
public class DeleteBooking extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String id = request.getParameter("id");
        OrderDAO dao = new OrderDAO();
        // Status 2: admin confirm lai duoc huy va hoan tien 
        if (dao.getOrderByID(Integer.parseInt(id)).getStatus().equalsIgnoreCase("1")) {
            dao.updateOrderStatus(Integer.parseInt(id), 2);
            session.setAttribute("messHuyTour", "Bạn phải chờ admin xác nhận từ 1-2 ngày để hủy tour và hoàn lại tiền");
        }
        if (dao.getOrderByID(Integer.parseInt(id)).getStatus().equalsIgnoreCase("0")) {
            dao.deleteOrder(Integer.parseInt(id));
        }
        response.sendRedirect("MyBooking");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
