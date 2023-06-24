package controller;

import DAO.ActivityTourDAO;
import DAO.CityDAO;
import DAO.DiscountDAO;
import DAO.HotelDAO;
import DAO.OrderDAO;
import DAO.TickerDAO;
import DAO.TourDAO;
import entities.Activiti;
import entities.Discount;
import entities.Order;
import entities.Ticket;
import entities.Tour;
import entities.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

@WebServlet(name = "BookingTourServlet", urlPatterns = {"/BookingTour"})
public class BookingTourServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ActivityTourDAO atDao = new ActivityTourDAO();
        TourDAO dao = new TourDAO();
        HotelDAO hDAO = new HotelDAO();
        CityDAO cDAO = new CityDAO();
        String id_raw = request.getParameter("id");
        request.setAttribute("people", 1);
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");

        if (u == null) {
            request.setAttribute("showModalJS_login", true);
            request.getRequestDispatcher("checkOut.jsp").forward(request, response);
        } else {
            Tour t = dao.getTourByID(Integer.parseInt(id_raw));
            Double price = t.getTotalPrice();
            List<Activiti> lt = atDao.loadAllActivityTourByTourID(id_raw);
            List<Tour> list = dao.getAllTours();
//            request.setAttribute("city", tDAO.CityName(id_raw).getCity_Name());
            request.setAttribute("city", cDAO.getCiHName(Integer.parseInt(id_raw)));
            request.setAttribute("voucherCode", request.getParameter("voucherCode"));
            request.setAttribute("hotel", cDAO.getCiHName(Integer.parseInt(id_raw)));
            request.setAttribute("totalPrice", price);
            request.setAttribute("tour", list);
            request.setAttribute("id", id_raw);
            request.setAttribute("t", dao.getTourByID(Integer.parseInt(id_raw)));
            request.getRequestDispatcher("checkOut.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ActivityTourDAO atDao = new ActivityTourDAO();
        TourDAO dao = new TourDAO();
        HotelDAO hDAO = new HotelDAO();
        CityDAO cDAO = new CityDAO();
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        if (u == null) {
            response.sendRedirect("signup");
        }
        String startDate = request.getParameter("startDate");
        String action = request.getParameter("action");
        int people = Integer.parseInt(request.getParameter("people"));
        String id = request.getParameter("id");
        Tour t = dao.getTourByID(Integer.parseInt(id));
        Double price = t.getTotalPrice();
        Double totalPrice = price * people;
        if (action != null && !action.isEmpty()) {
            if (action.equalsIgnoreCase("UP")) {
                people += 1;
            } else if (action.equalsIgnoreCase("DOWN")) {
                if (people > 1) {
                    people -= 1;
                }
            }
        }
        int discount = 0;
        if (people > 5) {
            discount = 10;
            request.setAttribute("discount", "10");
        }
        if (people > 2) {
            discount = 5;
            request.setAttribute("discount", "5");
        }
        if (people > 10) {
            discount = 15;
            request.setAttribute("discount", "15");
        }
        int voucherDiscount = 0;
        if (action.equalsIgnoreCase("Check voucher")) {
            DiscountDAO dDAO = new DiscountDAO();
            Discount a = new Discount();
            a = dDAO.getVoucherByCode(request.getParameter("voucherCode"));
            if (a != null) {
                voucherDiscount = a.getDiscount();
            } else {
                request.setAttribute("voucherMessage", "Not valid!");
            }
        }
        request.setAttribute("voucher", voucherDiscount);
        totalPrice = totalPrice - totalPrice * discount / 100 - totalPrice * voucherDiscount / 100;
//                            response.getWriter().print(people+"dqwewqeewqeqwwqe");
        
        ////////////////////////////////////////
        String id_raw = request.getParameter("id");
        ActivityTourDAO tDao = new ActivityTourDAO();
        List<Activiti> lt = atDao.loadAllActivityTourByTourID(id_raw);
        List<Tour> list = dao.getAllTours();
//        response.getWriter().print(cDAO.getCityByID(Integer.parseInt(id_raw)).getCity_Name());
        request.setAttribute("cityH", cDAO.getCiHName(Integer.parseInt(id_raw)));
        request.setAttribute("voucherCode", request.getParameter("voucherCode"));
        request.setAttribute("hotel", cDAO.getCiHName(Integer.parseInt(id_raw)));
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("tour", list);
        request.setAttribute("id", id_raw);
        request.setAttribute("t", dao.getTourByID(Integer.parseInt(id_raw)));

        request.setAttribute("people", people); // Update the 'people' attribute with the updated value
        // Booking
        if (action.equalsIgnoreCase("Book")) {
            OrderDAO o = new OrderDAO();
            Order order = new Order();
            order.setUserId(u.getUserID());
            order.setPeople(people);
            order.setStatus("0");
            order.setTotal(totalPrice);
            order.setTourId(t.getTour_ID());
            order.setStartAddress(request.getParameter("address"));
            order.setStartDate(startDate);
            o.insertOrder(order);
            response.sendRedirect("MyBooking");
        } else {
            request.getRequestDispatcher("checkOut.jsp").forward(request, response);
        }
    }

}
