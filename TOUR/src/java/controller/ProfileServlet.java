/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.UserDAO;
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
@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String fullName = request.getParameter("Fullname");
        String cmnd = request.getParameter("cccd");
        String phone = request.getParameter("phoe");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String userType = request.getParameter("userType");
        user.setFullname(fullName);
        user.setCmnd(cmnd);
        user.setPhone(phone);
        user.setEmail(email);
        user.setAddress(address);
        dao.updateProfile(user);
        request.setAttribute("mess", "Update successfully!");
        request.getRequestDispatcher("profile.jsp").forward(request, response);

    }

}
