/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entities.Type;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tungl
 */
public class TypeDAO extends MyDAO {

    public List<Type> getAllType() {
        List<Type> types = new ArrayList<>();
        String sql = "SELECT [Type_ID], [Type_name], [Is_Delete] FROM [dbo].[TourType]";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int typeID = rs.getInt("Type_ID");
                String typeName = rs.getString("Type_name");
                boolean isDelete = rs.getBoolean("Is_Delete");

                Type type = new Type(typeID, typeName, isDelete);
                types.add(type);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return types;
    }

    public void insertType(Type type) {
        String sql = "INSERT INTO [dbo].[TourType] ([Type_Name], [Is_Delete]) VALUES (?, ?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, type.getType_Name());
            ps.setBoolean(2, type.isIsDelete());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateType(Type type) {
        String sql = "UPDATE [dbo].[TourType] SET [Type_Name] = ?, [Is_Delete] = ? WHERE [Type_ID] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, type.getType_Name());
            ps.setBoolean(2, type.isIsDelete());
            ps.setInt(3, type.getType_ID());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteType(int typeID) {
        String sql = "DELETE FROM [dbo].[TourType] WHERE [Type_ID] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, typeID);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Type getTypeByID(int typeID) {
        Type type = null;
        String sql = "SELECT [Type_ID], [Type_Name], [Is_Delete] FROM [dbo].[TourType] WHERE [Type_ID] = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, typeID);
            rs = ps.executeQuery();

            if (rs.next()) {
                String typeName = rs.getString("Type_Name");
                boolean isDelete = rs.getBoolean("Is_Delete");
                type = new Type(typeID, typeName, isDelete);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return type;
    }

}
