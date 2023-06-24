/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

/**
 *
 * @author tungl
 */
public class User {

    private int userID;
    private String fullname;
    private String cmnd;
    private String email;
    private String userName;
    private String password;
    private String phone;
    private boolean gender;
    private String date;
    private String address;
    private boolean isBlocked;
    private String roleName;

    public User() {
    }

    public User(int userID, String fullname, String cmnd, String email, String userName, String password, String phone, boolean gender, String date, String address, boolean isBlocked, String roleName) {
        this.userID = userID;
        this.fullname = fullname;
        this.cmnd = cmnd;
        this.email = email;
        this.userName = userName;
        this.password = password;
        this.phone = phone;
        this.gender = gender;
        this.date = date;
        this.address = address;
        this.isBlocked = isBlocked;
        this.roleName = roleName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getCmnd() {
        return cmnd;
    }

    public void setCmnd(String cmnd) {
        this.cmnd = cmnd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isIsBlocked() {
        return isBlocked;
    }

    public void setIsBlocked(boolean isBlocked) {
        this.isBlocked = isBlocked;
    }

    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", fullname=" + fullname + ", cmnd=" + cmnd + ", email=" + email + ", userName=" + userName + ", password=" + password + ", phone=" + phone + ", gender=" + gender + ", date=" + date + ", address=" + address + ", isBlocked=" + isBlocked + ", roleName=" + roleName + '}';
    }
    
}
