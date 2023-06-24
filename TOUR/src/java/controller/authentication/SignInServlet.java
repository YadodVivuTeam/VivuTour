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
@WebServlet(name = "SignInServlet", urlPatterns = {"/signin"})
public class SignInServlet extends HttpServlet {

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
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("email");
        String password = request.getParameter("password");
        request.setAttribute("showModal", false);
        UserDAO dao = new UserDAO();
        User u = dao.checkAuthentication(user, password);
        request.setAttribute("user", u);
        HttpSession session = request.getSession();
        session.setAttribute("user", u);
        request.setAttribute("showModalRegister", false);
//        response.getWriter().print(u.getUserType());
        if (u == null) {
            request.setAttribute("showModal", true);
            request.setAttribute("mess", "Email or password not correct!");
            request.getRequestDispatcher("index.jsp").forward(request, response);

        } else {
            response.sendRedirect("home");
        }
    }

}
