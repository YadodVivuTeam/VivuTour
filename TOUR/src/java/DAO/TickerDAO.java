/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entities.Ticket;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tungl
 */
public class TickerDAO extends MyDAO {

    public List<Ticket> getAllTicketByUser(int userID) {
        List<Ticket> ticketList = new ArrayList<>();
        String sql = "SELECT [ID], [Code], [Name], [UserID], [TourID] FROM [dbo].[Ticket] WHERE [UserID] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();

            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setId(rs.getInt("ID"));
                ticket.setCode(rs.getString("Code"));
                ticket.setName(rs.getString("Name"));
                ticket.setUserID(rs.getInt("UserID"));
                ticket.setTourID(rs.getInt("TourID"));
                ticketList.add(ticket);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ticketList;
    }

    public void insertTicket(Ticket ticket) {
        String sql = "INSERT INTO [dbo].[Ticket] ([Code], [Name], [UserID], [TourID]) VALUES (?, ?, ?, ?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, ticket.getCode());
            ps.setString(2, ticket.getName());
            ps.setInt(3, ticket.getUserID());
            ps.setInt(4, ticket.getTourID());

            ps.executeUpdate();

            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
//        Ticket t = new Ticket();
//        t.setCode("dưq");
//        t.setId(1);
//        t.setName("Ticket");
//        t.setUserID(1);
//        t.setTourID(1);
        TickerDAO tDAO = new TickerDAO();
//        tDAO.insertTicket(t);
        System.out.println(tDAO.getAllTicketByUser(1).size());
    }

}
