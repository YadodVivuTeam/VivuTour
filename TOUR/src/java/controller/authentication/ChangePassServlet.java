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
@WebServlet(name = "ChangePassServlet", urlPatterns = {"/changePassword"})
public class ChangePassServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        String reNew = request.getParameter("re_new");

        request.setAttribute("oldPass", oldPass);
        request.setAttribute("newPass", newPass);
        request.setAttribute("re_new", reNew);
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        String reNew = request.getParameter("re_new");

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        UserDAO dao = new UserDAO();

        int status = 1;

//        response.getWriter().print(dao.checkAuthentication(u.getUserName(), oldPass));
        if (dao.checkAuthentication(u.getUserName(), oldPass) == null) {
            status = 0;
            request.setAttribute("messOldPass", "Old password not correct!");
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
            dao.updatePassword("userName", u.getUserName(), newPass);
            session.setAttribute("mess", "Change password successfuly!");
            response.sendRedirect("profile");
        } else {
            session.setAttribute("mess", null);
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }

    }

}
