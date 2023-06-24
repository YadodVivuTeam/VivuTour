/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entities.User;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tungl
 */
public class UserDAO extends MyDAO {

    public User checkAuthentication(String user, String pass) {
        User userObj = null;
        String xSql = "SELECT U.[UserID], U.[FullName], U.[cmnd], U.[Email], U.[UserName], U.[Password], U.[Phone], U.[Gender], U.[DOB], U.[Address], U.[IsBlocked], R.[Role_name]\n"
                + "FROM [dbo].[User] U\n"
                + "JOIN Role R ON U.Role_ID = R.Role_ID\n"
                + "WHERE (U.[UserName] = ? AND U.[Password] = ? AND U.[IsBlocked] = 0)\n"
                + "   OR (U.[Email] = ? AND U.[Password] = ? AND U.[IsBlocked] = 0)";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, user);
            ps.setString(4, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                userObj = new User();
                userObj.setUserID(rs.getInt("UserID"));
                userObj.setFullname(rs.getString("FullName"));
                userObj.setCmnd(rs.getString("cmnd"));
                userObj.setEmail(rs.getString("Email"));
                userObj.setUserName(rs.getString("UserName"));
                userObj.setPassword(rs.getString("Password"));
                userObj.setPhone(rs.getString("Phone"));
                userObj.setGender(rs.getBoolean("Gender"));
                userObj.setDate(rs.getString("DOB"));
                userObj.setAddress(rs.getString("Address"));
                userObj.setIsBlocked(rs.getBoolean("IsBlocked"));
                userObj.setRoleName(rs.getString("Role_name"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userObj;
    }

    public User searchUser(String mode, String input) {
        User userObj = null;
        String xSql = "SELECT [UserID], [FullName], [cmnd], [Email], [userName], [Phone], [Role_name], [IsBlocked] FROM [dbo].[User] u "
                + "join [dbo].Role r on u.Role_ID = r.Role_ID WHERE  " + mode + " = ? ";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, input);
            rs = ps.executeQuery();

            if (rs.next()) {
                userObj = new User();
                userObj.setUserID(rs.getInt("UserID"));
                userObj.setFullname(rs.getString("FullName"));
                userObj.setCmnd(rs.getString("cmnd"));
                userObj.setEmail(rs.getString("Email"));
                userObj.setUserName(rs.getString("userName"));
                userObj.setPhone(rs.getString("Phone"));
                userObj.setRoleName(rs.getString("Role_name"));
                userObj.setIsBlocked(rs.getBoolean("IsBlocked"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userObj;
    }

    public boolean registerUser(String fullName, String cmnd, String email, String userName, String password, String phone, String userType, boolean isBlocked) {
        String xSql = "INSERT INTO [dbo].[User] ([FullName], [cmnd], [Email], [userName], [Password], [Phone], [Role_ID], [IsBlocked]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, fullName);
            ps.setString(2, cmnd);
            ps.setString(3, email);
            ps.setString(4, userName);
            ps.setString(5, password);
            ps.setString(6, phone);
            ps.setString(7, userType);
            ps.setBoolean(8, isBlocked);

            int rowsAffected = ps.executeUpdate();

            ps.close();

            if (rowsAffected > 0) {
                return true; // Đăng ký thành công
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false; // Đăng ký thất bại
    }

    public boolean updateProfile(User userObj) {
        boolean success = false;
        String updateSql = "UPDATE [dbo].[User] SET [FullName] = ?, [cmnd] = ?, [Email] = ?, [UserName] = ?, [Phone] = ?, [Gender] = ?, [DOB] = ?, [Address] = ? WHERE [UserID] = ?";

        try {
            ps = con.prepareStatement(updateSql);
            ps.setString(1, userObj.getFullname());
            ps.setString(2, userObj.getCmnd());
            ps.setString(3, userObj.getEmail());
            ps.setString(4, userObj.getUserName());
            ps.setString(5, userObj.getPhone());
            ps.setBoolean(6, userObj.isGender());
            ps.setString(7, userObj.getDate());
            ps.setString(8, userObj.getAddress());
            ps.setInt(9, userObj.getUserID());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }

            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

    public boolean updatePassword(String mode, String username, String newPassword) {
        boolean success = false;
        String updateSql = "UPDATE [dbo].[User] SET [Password] = ? WHERE [" + mode + "] = ?";

        try {
            ps = con.prepareStatement(updateSql);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }

    public List<User> getAll() {
        String xSql = "SELECT [UserID]\n"
                + "      ,[FullName]\n"
                + "      ,[cmnd]\n"
                + "      ,[Email]\n"
                + "      ,[UserName]\n"
                + "      ,[Phone]\n"
                + "      ,[Gender]\n"
                + "      ,[DOB]\n"
                + "      ,[Address]\n"
                + "      ,[IsBlocked]\n"
                + "      ,[Role_ID] FROM [dbo].[User]";
        List<User> ls = new ArrayList<>();
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            while (rs.next()) {
                User userObj = new User();
                userObj.setUserID(rs.getInt("UserID"));
                userObj.setFullname(rs.getString("FullName"));
                userObj.setCmnd(rs.getString("cmnd"));
                userObj.setEmail(rs.getString("Email"));
                userObj.setUserName(rs.getString("UserName"));
                userObj.setPhone(rs.getString("Phone"));
                userObj.setGender(rs.getBoolean("Gender"));
                userObj.setDate(rs.getString("DOB"));
                userObj.setAddress(rs.getString("Address"));
                userObj.setRoleName(rs.getString("Role_ID"));
                userObj.setIsBlocked(rs.getBoolean("IsBlocked"));
                ls.add(userObj);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ls;
    }

    public List<User> getAllByType(String type) {
        User userObj = null;
        String xSql = "SELECT [UserID], [FullName], [cmnd], [Email], [userName], [Phone], [UserType], [IsBlocked] FROM [dbo].[Users] WHERE [UserType] = ?";
        List<User> ls = new ArrayList<>();
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, type);

            rs = ps.executeQuery();

            while (rs.next()) {
                userObj = new User();
                userObj.setUserID(rs.getInt("UserID"));
                userObj.setFullname(rs.getString("FullName"));
                userObj.setCmnd(rs.getString("cmnd"));
                userObj.setEmail(rs.getString("Email"));
                userObj.setUserName(rs.getString("userName"));
                userObj.setPhone(rs.getString("Phone"));
                userObj.setIsBlocked(rs.getBoolean("IsBlocked"));
                ls.add(userObj);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ls;
    }

    public void updateActive(String userID, Boolean active) {
        String updateSql = "UPDATE [dbo].[User]\n"
                + "   SET \n"
                + "      [IsBlocked] = ?\n"
                + "     \n"
                + " WHERE [USERID] = ? ";

        try {
            ps = con.prepareStatement(updateSql);

            ps.setBoolean(1, active);
            ps.setString(2, userID);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        System.out.println(dao.checkAuthentication("tung@123.com", "1").getRoleName());
//        User a = new User(1, "tung", "1111111111", "tung@123.com", "tung", "1", "1111111", true, "2002/12/12", "HN", true, "admin");
////        System.out.println(dao.updateProfile(a));
//        System.out.println(dao.searchUser("cmnd", "0987654321").getRoleName());
//System.out.println(dao.getAll());
//        System.out.println(dao.updatePassword("UserName","tung", "123"));
//            dao.registerUser("TUNG", "111111111", "Tung@dqw.com", "tung123", "123", "123123123", "3", false);
    }
}
