/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author tungl
 */
public class Order {

    private int orderId;
    private int userId;
    private int people;
    private String dateOrder;
    private double total;
    private String status;
    private int tourId;
    private String startAddress;
    private String tourName;
    private String fullName;
    private String email;
    private String startDate;

    public Order() {
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStartAddress() {
        return startAddress;
    }

    public void setStartAddress(String startAddress) {
        this.startAddress = startAddress;
    }

    public int getPeople() {
        return people;
    }

    public void setPeople(int people) {
        this.people = people;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDateOrder() {
        if (dateOrder == null) {
            return null;
        }

        SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S"); // Input date format pattern
        SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MM/yyyy"); // Output date format pattern

        try {
            Date date = inputDateFormat.parse(dateOrder); // Parsing the input date string
            return outputDateFormat.format(date); // Formatting the date string
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void setDateOrder(String date) {
        this.dateOrder = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", userId=" + userId + ", date=" + dateOrder + ", total=" + total + ", status=" + status + ", tourId=" + tourId + '}';
    }

}
