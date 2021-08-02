/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minh.daos;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Date;
import java.text.SimpleDateFormat;
import minh.connections.MyConnection;
import minh.dtos.PromotionListDTO;

/**
 *
 * @author IamDell
 */
public class PromotionDAO implements Serializable {
    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public PromotionDAO() {
    }
    
    private void closeConnection() {
        try {
            if (rs != null)
                rs.close();
            if (ps != null)
                ps.close();
            if (con != null)
                con.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
    public ArrayList<PromotionListDTO> getPromotionList() throws Exception {
        ArrayList<PromotionListDTO> promotionList = new ArrayList<>();
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT users_id, promote_code, promote_rank, promote_date "
                    + "FROM PromotionList";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String userID = rs.getString("users_id");
                String promoteCode = rs.getString("promote_code");
                double promoteRank = rs.getDouble("promote_rank");
                Date promoteDate = rs.getDate("promote_date");
                PromotionListDTO dto = new PromotionListDTO(promoteCode, promoteRank, promoteDate, userID);
                promotionList.add(dto);
            }
        } finally {
            closeConnection();
        }
        return promotionList;
    }
    
    public boolean promoteUser(String userID) throws Exception {
        boolean result = false;
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Calendar promoteDate = Calendar.getInstance();
        try {
            con = MyConnection.getConnection();
            String sql = "INSERT INTO PromotionList(promote_rank, promote_date, users_id) "
                    + "VALUES(?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setDouble(1, 5.0);
            ps.setString(2, formatter.format(promoteDate.getTime()));
            ps.setString(3, userID);
            result = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean demoteUser(String userID) throws Exception {
        boolean result = false;
        try {
            con = MyConnection.getConnection();
            String sql = "DELETE FROM PromotionList WHERE users_id = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, userID);
            result = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean updateRank(String userID, String rank) throws Exception {
        boolean result = false;
        try {
            con = MyConnection.getConnection();
            String sql = "UPDATE PromotionList "
                    + "SET promote_rank = ? "
                    + "WHERE users_id = ?";
            ps = con.prepareStatement(sql);
            ps.setDouble(1, Double.parseDouble(rank));
            ps.setString(2, userID);
            result = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
}
