/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entities.Feedback;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tungl
 */
public class FeedbackDAO extends MyDAO {

    public List<Feedback> getFeedback(int id) {
        List<Feedback> feedbackList = new ArrayList<>();
        String sql = "SELECT [ID], [TourID], [UserID], [Context], [Vote] FROM [dbo].[Feedback] WHERE [TourID] = "+id;

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int ID = rs.getInt("ID");
                int tourID = rs.getInt("TourID");
                int userID = rs.getInt("UserID");
                String context = rs.getString("Context");
                int vote = rs.getInt("Vote");

                Feedback feedback = new Feedback();
                feedback.setID(ID);
                feedback.setTourID(tourID);
                feedback.setUserID(userID);
                feedback.setContext(context);
                feedback.setVote(vote);

                feedbackList.add(feedback);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return feedbackList;
    }

    public void addComment(int tourID, int userID, String context, int vote) {
        String sql = "INSERT INTO [dbo].[Feedback] ([TourID], [UserID], [Context], [Vote])"
                + "VALUES (?, ?, ?, ?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, tourID);
            ps.setInt(2, userID);
            ps.setString(3, context);
            ps.setInt(4, vote);

            ps.executeUpdate();

            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        FeedbackDAO fDAO = new FeedbackDAO();
        System.out.println(fDAO.getFeedback(1).size());
        fDAO.addComment(1, 1, "OK", 5);
    }

}
