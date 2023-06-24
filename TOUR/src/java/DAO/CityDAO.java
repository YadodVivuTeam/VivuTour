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
public class CityDAO extends MyDAO {

    public List<City> getAllCity() {
        List<City> cities = new ArrayList<>();
        String sql = "SELECT [City_ID], [CityName] FROM [dbo].[City]";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int cityID = rs.getInt("City_ID");
                String cityName = rs.getString("CityName");

                City city = new City(cityID, cityName);
                cities.add(city);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cities;
    }

    public City getCityByID(int cityID) {
        City city = null;
        String sql = "SELECT [City_ID], [CityName] FROM [dbo].[City] WHERE [City_ID] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, cityID);
            rs = ps.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("City_ID");
                String cityName = rs.getString("CityName");

                city = new City(id, cityName);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return city;
    }

    public Hotel getCiHName(int tourID) {
        Hotel h = new Hotel();
        String sql = "Select *\n"
                + "FROM Hotel h JOIN City c\n"
                + "ON h.CityID = c.City_ID\n"
                + "JOIN Tour t ON t.HotelID = h.ID\n"
                + "WHERE t.Tour_ID = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, tourID);
            rs = ps.executeQuery();

            if (rs.next()) {
                h.setCityName(rs.getString(10));
                h.setHotel_Name(rs.getString("Name"));
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return h;
    }

    public static void main(String[] args) {
        CityDAO cDAO = new CityDAO();
        HotelDAO hDAO = new HotelDAO();
//        System.out.println(cDAO.getCityByID(hDAO.getHotelByID(1).getCityID()).getCity_Name());
//        System.out.println(cDAO.getAllCity().size());
        System.out.println(cDAO.getCiHName(4));
    }
}
