/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

/**
 *
 * @author MienTrungComputer
 */
public class City {

    private int city_ID;
    private String city_Name;
    private int hotelID;

    public City() {
    }

    public City(int city_ID, String city_Name) {
        this.city_ID = city_ID;
        this.city_Name = city_Name;
    }

    public int getCity_ID() {
        return city_ID;
    }

    public int getHotelID() {
        return hotelID;
    }

    public void setHotelID(int hotelID) {
        this.hotelID = hotelID;
    }

    public void setCity_ID(int city_ID) {
        this.city_ID = city_ID;
    }

    public String getCity_Name() {
        return city_Name;
    }

    public void setCity_Name(String city_Name) {
        this.city_Name = city_Name;
    }

}
