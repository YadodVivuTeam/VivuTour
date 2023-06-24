/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import entities.User;
import java.util.List;

/**
 *
 * @author tungl
 */
@WebServlet(name = "GetAccountServlet", urlPatterns = {"/admin/getAccount"})
public class GetAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        List<User> list = dao.getAll();
        request.setAttribute("listAcc", list);
        request.getRequestDispatcher("userManager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("userType");
        if (type.equalsIgnoreCase("all")) {
            request.getRequestDispatcher("/admin/getAccount").forward(request, response);

        }
        UserDAO dao = new UserDAO();
        List<User> list = dao.getAllByType(type);
        request.setAttribute("listAcc", list);
//        response.getWriter().print(type);
        request.getRequestDispatcher("userManager.jsp").forward(request, response);

    }
}
