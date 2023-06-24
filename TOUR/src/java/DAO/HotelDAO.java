/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entities.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tungl
 */
public class HotelDAO extends MyDAO {

    public List<Hotel> getAllHotel() {
        List<Hotel> hotels = new ArrayList<>();
        String sql = "SELECT [ID], [Name], [Room], [Active], [isDelete], [IMG], [Description], [CityID] FROM [dbo].[Hotel]";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int hotelID = rs.getInt("ID");
                String hotelName = rs.getString("Name");
                String room = rs.getString("Room");
                boolean active = rs.getBoolean("Active");
                boolean isDelete = rs.getBoolean("isDelete");
                String img = rs.getString("IMG");
                String description = rs.getString("Description");
                int cityID = rs.getInt("CityID");

                Hotel hotel = new Hotel();
                hotel.setHotel_ID(hotelID);
                hotel.setHotel_Name(hotelName);
                hotel.setRoom(room);
                hotel.setActive(active);
                hotel.setIsDelete(isDelete);
                hotel.setIMG(img);
                hotel.setDescription(description);
                hotel.setCityID(cityID);

                hotels.add(hotel);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotels;
    }
    
    public List<Hotel> getListHotelByCity(int CityID) {
        List<Hotel> hotels = new ArrayList<>();
        String sql = "SELECT [ID], [Name], [Room], [Active], [isDelete], [IMG], [Description], [CityID] FROM [dbo].[Hotel] WHERE CityID = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, CityID);
            rs = ps.executeQuery();

            while (rs.next()) {
                int hotelID = rs.getInt("ID");
                String hotelName = rs.getString("Name");
                String room = rs.getString("Room");
                boolean active = rs.getBoolean("Active");
                boolean isDelete = rs.getBoolean("isDelete");
                String img = rs.getString("IMG");
                String description = rs.getString("Description");
                int cityID = rs.getInt("CityID");

                Hotel hotel = new Hotel();
                hotel.setHotel_ID(hotelID);
                hotel.setHotel_Name(hotelName);
                hotel.setRoom(room);
                hotel.setActive(active);
                hotel.setIsDelete(isDelete);
                hotel.setIMG(img);
                hotel.setDescription(description);
                hotel.setCityID(cityID);

                hotels.add(hotel);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotels;
    }
    
    public void insertHotel(Hotel hotel) {
        String sql = "INSERT INTO [dbo].[Hotel] ([Name], [Room], [Active], [isDelete], [IMG], [Description], [CityID]) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, hotel.getHotel_Name());
            ps.setString(2, hotel.getRoom());
            ps.setBoolean(3, hotel.isActive());
            ps.setBoolean(4, hotel.isIsDelete());
            ps.setString(5, hotel.getIMG());
            ps.setString(6, hotel.getDescription());
            ps.setInt(7, hotel.getCityID());

            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Hotel getHotelByID(int hotelID) {
        Hotel hotel = null;
        String sql = "SELECT [ID], [Name], [Room], [Active], [isDelete], [IMG], [Description], [CityID], c.CityName FROM [dbo].[Hotel] h Join City c ON h.CityID = c.City_ID WHERE h.[ID] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, hotelID);
            rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("ID");
                String name = rs.getString("Name");
                String room = rs.getString("Room");
                boolean active = rs.getBoolean("Active");
                boolean isDelete = rs.getBoolean("isDelete");
                String img = rs.getString("IMG");
                String description = rs.getString("Description");
                int cityID = rs.getInt("CityID");

                hotel = new Hotel();
                hotel.setHotel_ID(id);
                hotel.setHotel_Name(name);
                hotel.setRoom(room);
                hotel.setActive(active);
                hotel.setIsDelete(isDelete);
                hotel.setIMG(img);
                hotel.setDescription(description);
                hotel.setCityID(cityID);
                hotel.setCityName(rs.getString("CityName"));
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotel;
    }

    public List<Hotel> getHotelsByCityID(int cityID) {
        List<Hotel> hotels = new ArrayList<>();
        String sql = "SELECT [ID], [Name], [Room], [Active], [isDelete], [IMG], [Description], [CityID] FROM [dbo].[Hotel] WHERE [CityID] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cityID);
            rs = ps.executeQuery();

            while (rs.next()) {
                int hotelID = rs.getInt("ID");
                String hotelName = rs.getString("Name");
                String room = rs.getString("Room");
                boolean active = rs.getBoolean("Active");
                boolean isDelete = rs.getBoolean("isDelete");
                String img = rs.getString("IMG");
                String description = rs.getString("Description");

                Hotel hotel = new Hotel();
                hotel.setHotel_ID(hotelID);
                hotel.setHotel_Name(hotelName);
                hotel.setRoom(room);
                hotel.setActive(active);
                hotel.setIsDelete(isDelete);
                hotel.setIMG(img);
                hotel.setDescription(description);
                hotel.setCityID(cityID);

                hotels.add(hotel);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotels;
    }

    public static void main(String[] args) {
        HotelDAO hDAO = new HotelDAO();
        CityDAO cDAO = new CityDAO();
        TourDAO tDAO = new TourDAO();
        System.out.println(hDAO.getAllHotel().size());
//        System.out.println(hDAO.getCityByHotel(1).getCity_Name());
//        System.out.println(hDAO.getAllHotel().size());
//        System.out.println(hDAO.getHotel(cDAO.getCityByID(1).getHotelID()).getHotel_Name());
    }

}
