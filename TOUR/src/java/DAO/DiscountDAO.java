/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entities.Discount;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DiscountDAO extends MyDAO {

    public List<Discount> listVoucher() {
        String sql = "SELECT [Discount_ID]\n"
                + "      ,[Description]\n"
                + "      ,[DiscountCode]\n"
                + "      ,[StartDate]\n"
                + "      ,[EndDate]\n"
                + "      ,[Discount]\n"
                + "      ,[Quantity]\n"
                + "  FROM [dbo].[Discount]";
        List<Discount> lv = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Discount v = new Discount();
                v.setDiscountID(rs.getInt(1));
                v.setDescription(rs.getString(2));
                v.setDiscountCode(rs.getString(3));
                v.setStartDate(formatDateToString(rs.getDate(4)));
                v.setEndDate(formatDateToString(rs.getDate(5)));
                v.setDiscount(rs.getInt(6));
                v.setQuantity(rs.getInt(7));
                lv.add(v);
            }
        } catch (Exception e) {
        }
        return lv;
    }

    public void addVoucher(String name, String code, String start, String end, int discount, int quantity) {
        String sql = "INSERT INTO [dbo].[Discount]\n"
                + "           ([Description]\n"
                + "           ,[DiscountCode]\n"
                + "           ,[StartDate]\n"
                + "           ,[EndDate]\n"
                + "           ,[Discount]\n"
                + "           ,[Quantity])\n"
                + "     VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, code);
            ps.setString(3, start);
            ps.setString(4, end);
            ps.setInt(5, discount);
            ps.setInt(6, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Discount getVoucherByCode(String code) {
        Discount voucher = null;
        String sql = "SELECT [Discount_ID], [Description], [StartDate], [EndDate], [Discount], [Quantity], [DiscountCode] FROM [dbo].[Discount] WHERE [DiscountCode] = ?"
                + " AND [EndDate] >= GETDATE() AND [Quantity] > =1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                voucher = new Discount();
                voucher.setDiscountID(rs.getInt("Discount_ID"));
                voucher.setDescription(rs.getString("Description"));
                voucher.setStartDate(rs.getString("StartDate"));
                voucher.setEndDate(rs.getString("EndDate"));
                voucher.setDiscount(rs.getInt("Discount"));
                voucher.setQuantity(rs.getInt("Quantity"));
                voucher.setDiscountCode(rs.getString("DiscountCode"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return voucher;
    }

    public static String formatDateToString(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        return dateFormat.format(date);
    }

    public static void main(String[] args) {
        DiscountDAO dDAO = new DiscountDAO();
        System.out.println(dDAO.getVoucherByCode("AOOABGHTFG"));
    }

}
