/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

/**
 *
 * @author MienTrungComputer
 */
public class Tour extends City{

    private int tour_ID;
    private String startDate;
    private String endDate;
    private int hotel_ID;
    private int city_ID;
    private int numberPeople;
    private String content;
    private String img;
    private double totalPrice;
    private Boolean isDelete;
    private int Type_name;
    private String tourName;

    public Tour() {
    }

    public Tour(String startDate, String endDate, int hotel_ID, int numberPeople, String content, String img, double totalPrice, Boolean isDelete, int Type_name, String tourName) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.hotel_ID = hotel_ID;
        this.numberPeople = numberPeople;
        this.content = content;
        this.img = img;
        this.totalPrice = totalPrice;
        this.isDelete = isDelete;
        this.Type_name = Type_name;
        this.tourName = tourName;
    }

    

    public int getTour_ID() {
        return tour_ID;
    }

    public void setTour_ID(int tour_ID) {
        this.tour_ID = tour_ID;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getHotel_ID() {
        return hotel_ID;
    }

    public void setHotel_ID(int hotel_ID) {
        this.hotel_ID = hotel_ID;
    }

    public int getCity_ID() {
        return city_ID;
    }

    public void setCity_ID(int city_ID) {
        this.city_ID = city_ID;
    }

    public int getNumberPeople() {
        return numberPeople;
    }

    public void setNumberPeople(int numberPeople) {
        this.numberPeople = numberPeople;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }

    public int getType_name() {
        return Type_name;
    }

    public void setType_name(int Type_name) {
        this.Type_name = Type_name;
    }

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    
    @Override
    public String toString() {
        return "Tour{" + "tour_ID=" + tour_ID + ", startDate=" + startDate + ", endDate=" + endDate + ", hotel_ID=" + hotel_ID + ", city_ID=" + city_ID + ", numberPeople=" + numberPeople + ", content=" + content + ", img=" + img + ", totalPrice=" + totalPrice + ", isDelete=" + isDelete + ", Type_name=" + Type_name + '}';
    }

}
