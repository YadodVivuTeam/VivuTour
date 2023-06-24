/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

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
@WebServlet(name = "SignupServlet", urlPatterns = {"/signup"})
public class SignupServlet extends HttpServlet {

    boolean status = true;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String cccd = request.getParameter("cccd");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("re_password");

        UserDAO dao = new UserDAO();
        if (dao.searchUser("Email", email) != null) {
            request.setAttribute("messEmail", "Email exist!");
            status = false;
        }
        if (dao.searchUser("userName", username) != null) {
            request.setAttribute("messUser", "Username exist!");
            status = false;
        }
        if (!password.matches(".{8,}")) {
            request.setAttribute("messPass", "Password great than 8 character!");
            status = false;
        }
        if (!password.equals(confirmPassword)) {
            request.setAttribute("messRePass", "Password and confirmpassword is same!");
            status = false;
        }
        if (status) {
            request.setAttribute("showModalJS_login", true);
            dao.registerUser(lastName + firstName, cccd, email, username, password, phone, "3", false);
        } else {
            request.setAttribute("showModalRegister", true);
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}
