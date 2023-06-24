/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import controller.*;
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
@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/forgot"})
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("email", request.getParameter("email"));
        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String cccd = request.getParameter("cccd");
        String newPass = request.getParameter("newPass");
        String reNew = request.getParameter("reNew");
        request.setAttribute("email", email);
        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession();
        User u = dao.searchUser("Email", email);
        int status = 1;
        if (u == null) {
            status = 0;
            request.setAttribute("messEmail", "Email does not exist!");
        }
        if (dao.searchUser("cmnd", cccd) == null) {
            status = 0;
            request.setAttribute("cccd", "Cccd does not correct!");
        }
        if (!newPass.matches(".{8,}")) {
            status = 0;
            request.setAttribute("messPass", "Password must be great than 8 character!");
        }
        if (!newPass.equals(reNew)) {
            status = 0;
            request.setAttribute("messRe", "New password and re-password must be same!");
        }
        if (status == 1) {
            dao.updatePassword("UserName", u.getUserName(), newPass);
            session.setAttribute("mess", "Change password successfuly!");
            response.sendRedirect("home");
        } else {
            session.setAttribute("mess", null);
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        }

    }
}
