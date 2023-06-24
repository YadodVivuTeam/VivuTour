/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entities.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MienTrungComputer
 */
public class TourDAO extends MyDAO {

    public int getLastestTourId() {

        String sql = "SELECT MAX(Tour_ID) FROM Tour";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TourDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Tour> getAllTours() {
        List<Tour> tours = new ArrayList<>();
        String sql = "SELECT [Tour_ID], [StartDate], [EndDate], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID], [HotelID], [TourName] FROM [dbo].[Tour]";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int tourID = rs.getInt("Tour_ID");
                String startDate = rs.getString("StartDate");
                String endDate = rs.getString("EndDate");
                int numberPeople = rs.getInt("NumberPeople");
                String content = rs.getString("Content");
                String img = rs.getString("IMG");
                double totalPrice = rs.getDouble("TotalPrice");
                boolean isDelete = rs.getBoolean("isDelete");
                int typeID = rs.getInt("Type_ID");
                int hotelID = rs.getInt("HotelID");

                Tour tour = new Tour();
                tour.setTour_ID(tourID);
                tour.setStartDate(startDate);
                tour.setEndDate(endDate);
                tour.setNumberPeople(numberPeople);
                tour.setContent(content);
                tour.setImg(img);
                tour.setTotalPrice(totalPrice);
                tour.setIsDelete(isDelete);
                tour.setType_name(typeID);
                tour.setHotel_ID(hotelID);
                tour.setTourName(rs.getString("TourName"));
                tours.add(tour);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tours;
    }

    public Tour getTourByID(int id) {
        Tour tour = null;
        String sql = "SELECT [Tour_ID], [StartDate], [EndDate], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID], [HotelID], [TourName] FROM [dbo].[Tour] WHERE [Tour_ID] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                int tourID = rs.getInt("Tour_ID");
                String startDate = rs.getString("StartDate");
                String endDate = rs.getString("EndDate");
                int numberPeople = rs.getInt("NumberPeople");
                String content = rs.getString("Content");
                String img = rs.getString("IMG");
                double totalPrice = rs.getDouble("TotalPrice");
                boolean isDelete = rs.getBoolean("isDelete");
                int typeID = rs.getInt("Type_ID");
                int hotelID = rs.getInt("HotelID");

                tour = new Tour();
                tour.setTour_ID(tourID);
                tour.setStartDate(startDate);
                tour.setEndDate(endDate);
                tour.setNumberPeople(numberPeople);
                tour.setContent(content);
                tour.setImg(img);
                tour.setTotalPrice(totalPrice);
                tour.setIsDelete(isDelete);
                tour.setType_name(typeID);
                tour.setHotel_ID(hotelID);
                tour.setTourName(rs.getString("TourName"));
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tour;
    }

    public void insertTour(Tour tour) {
        String sql = "INSERT INTO [dbo].[Tour] ([StartDate], [EndDate], [NumberPeople], [Content], [IMG], [TotalPrice], [isDelete], [Type_ID], [HotelID], [TourName]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, tour.getStartDate());
            ps.setString(2, tour.getEndDate());
            ps.setInt(3, tour.getNumberPeople());
            ps.setString(4, tour.getContent());
            ps.setString(5, tour.getImg());
            ps.setDouble(6, tour.getTotalPrice());
            ps.setBoolean(7, tour.getIsDelete());
            ps.setInt(8, tour.getType_name());
            ps.setInt(9, tour.getHotel_ID());
            ps.setString(10, tour.getTourName());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteTour(int tourID) {
        String sql = "DELETE FROM [dbo].[Tour]\n"
                + "WHERE [Tour_ID] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, tourID);
            ps.executeUpdate();

            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateTourByID(String start, String end, int numP, String content, String img, double price, boolean isDelete, int type, int hotel, String tourName, int tourID) {
        String sql = "UPDATE [dbo].[Tour]\n"
                + "   SET [StartDate] =  ?\n"
                + "      ,[EndDate] =  ?\n"
                + "      ,[NumberPeople] = ?\n"
                + "      ,[Content] =  ?\n"
                + "      ,[IMG] = ? \n"
                + "      ,[TotalPrice] =  ?\n"
                + "      ,[isDelete] =  ?\n"
                + "      ,[Type_ID] =  ?\n"
                + "      ,[HotelID] =  ?\n"
                + "      ,[TourName] =  ?\n"
                + " WHERE Tour_ID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, start);
            ps.setString(2, end);
            ps.setInt(3, numP);
            ps.setString(4, content);
            ps.setString(5, img);
            ps.setDouble(6, price);
            ps.setBoolean(7, isDelete);
            ps.setInt(8, type);
            ps.setInt(9, hotel);
            ps.setString(10, tourName);
            ps.setInt(11, tourID);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Tour> searchTourByCity(String cityName, String currentDate) {
        List<Tour> tours = new ArrayList<>();
        String sql = "SELECT t.[Tour_ID], t.[StartDate], t.[EndDate], t.[NumberPeople], t.[Content], t.[IMG], t.[TotalPrice], t.[isDelete], t.[Type_ID], t.[HotelID], t.[TourName], c.CityName "
                + "FROM [dbo].[Tour] t "
                + "INNER JOIN [dbo].[City] c ON t.HotelID = c.[City_ID] "
                + "JOIN [dbo].[Hotel] h ON h.ID = t.HotelID "
                + "WHERE c.[CityName] = ? OR t.EndDate >= ? AND ? >= t.StartDate";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, cityName);
            ps.setString(2, currentDate);
            ps.setString(3, currentDate);
            rs = ps.executeQuery();

            while (rs.next()) {
                int tourID = rs.getInt("Tour_ID");
                String startDate = rs.getString("StartDate");
                String endDate = rs.getString("EndDate");
                int numberPeople = rs.getInt("NumberPeople");
                String content = rs.getString("Content");
                String img = rs.getString("IMG");
                double totalPrice = rs.getDouble("TotalPrice");
                boolean isDelete = rs.getBoolean("isDelete");
                int typeID = rs.getInt("Type_ID");
                int hotelID = rs.getInt("HotelID");

                Tour tour = new Tour();
                tour.setTour_ID(tourID);
                tour.setStartDate(startDate);
                tour.setEndDate(endDate);
                tour.setNumberPeople(numberPeople);
                tour.setContent(content);
                tour.setImg(img);
                tour.setTotalPrice(totalPrice);
                tour.setIsDelete(isDelete);
                tour.setType_name(typeID);
                tour.setHotel_ID(hotelID);
                tour.setTourName(rs.getString("TourName"));
                tours.add(tour);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tours;
    }

    public static void main(String[] args) {
        TourDAO tDao = new TourDAO();
        //  tDao.deleteTour(9);
//        System.out.println(tDao.getTourByID(1).getStartDate());
//        Tour tour = new Tour("2020-01-02", "2020-01-02", 1, 24, "3", "24.00", 24.00, true, 2, "1");
        //   tDao.insertTour(tour);
//        System.out.println(tDao.getAllTours().get(0).getHotel_ID());
//        System.out.println(tDao.searchTourByCity("An Giang", "2023-12-12").size());
        System.out.println(tDao.getAllTours().get(0).getTourName());
    }
}
