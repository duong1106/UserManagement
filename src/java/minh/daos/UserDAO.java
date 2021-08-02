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
import minh.connections.MyConnection;
import minh.dtos.UserDTO;
import minh.dtos.RegistrationDTO;
import minh.utility.HashSHA256;
/**
 *
 * @author IamDell
 */
public class UserDAO implements Serializable {
    private Connection con = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public UserDAO() {
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
    
    public RegistrationDTO checkLogin(String inputUsername, String inputPassword) throws Exception {
        RegistrationDTO dto = null;
        byte[] bytes = HashSHA256.getSHA(inputPassword);
        String password = HashSHA256.toHexString(bytes);
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT username, roles FROM Registrations WHERE username = ? AND passwords = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, inputUsername);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                String roles = rs.getString("roles");
                dto = new RegistrationDTO(inputUsername, roles);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }
    
    public ArrayList<UserDTO> getAllUser() throws Exception {
        ArrayList<UserDTO> userList = new ArrayList<>();
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT users_id, [Users].[username], [Registrations].[roles], users_fname, users_lname, users_email, users_phone, users_photo "
                    + "FROM [Users] INNER JOIN [Registrations] " 
                    + "ON [Registrations].[username] = [Users].[username] " 
                    + "WHERE users_status = ?";
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, true);
            rs = ps.executeQuery();
            while (rs.next()) {
                int userID = rs.getInt("users_id");
                String username = rs.getString(2);
                String role = rs.getString(3);
                String userFName = rs.getString("users_fname");
                String userLName = rs.getString("users_lname");
                String userEmail = rs.getString("users_email");
                String userPhone = rs.getString("users_phone");
                String userPhoto = rs.getString("users_photo");
                UserDTO user = new UserDTO(userID, username, role, userFName, userLName, userEmail, userPhone, userPhoto, true);
                userList.add(user);
            }
        } finally {
            closeConnection();
        }
        return userList;
    }
    
    public ArrayList<UserDTO> getAllPatron() throws Exception {
        ArrayList<UserDTO> userList = new ArrayList<>();
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT users_id, [Users].[username], users_fname, users_lname, users_email, users_phone, users_photo "
                    + "FROM [Users] INNER JOIN [Registrations] " 
                    + "ON [Registrations].[username] = [Users].[username] " 
                    + "WHERE users_status = ? AND [Registrations].[roles] = ?";
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, true);
            ps.setString(2, "patron");
            rs = ps.executeQuery();
            while (rs.next()) {
                int userID = rs.getInt("users_id");
                String username = rs.getString(2);
                String userFName = rs.getString("users_fname");
                String userLName = rs.getString("users_lname");
                String userEmail = rs.getString("users_email");
                String userPhone = rs.getString("users_phone");
                String userPhoto = rs.getString("users_photo");
                UserDTO user = new UserDTO(userID, username, "patron", userFName, userLName, userEmail, userPhone, userPhoto, true);
                userList.add(user);
            }
        } finally {
            closeConnection();
        }
        return userList;
    }
    
    public ArrayList<UserDTO> getAllAdmin() throws Exception {
        ArrayList<UserDTO> userList = new ArrayList<>();
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT users_id, [Users].[username], users_fname, users_lname, users_email, users_phone, users_photo "
                    + "FROM [Users] INNER JOIN [Registrations] " 
                    + "ON [Registrations].[username] = [Users].[username] " 
                    + "WHERE users_status = ? AND [Registrations].[roles] = ?";
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, true);
            ps.setString(2, "admin");
            rs = ps.executeQuery();
            while (rs.next()) {
                int userID = rs.getInt("users_id");
                String username = rs.getString(2);
                String userFName = rs.getString("users_fname");
                String userLName = rs.getString("users_lname");
                String userEmail = rs.getString("users_email");
                String userPhone = rs.getString("users_phone");
                String userPhoto = rs.getString("users_photo");
                UserDTO user = new UserDTO(userID, username, "admin", userFName, userLName, userEmail, userPhone, userPhoto, true);
                userList.add(user);
            }
        } finally {
            closeConnection();
        }
        return userList;
    }
    
    public UserDTO getUserInfo(String username) throws Exception {
        UserDTO user = null;
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT users_id, username, users_fname, users_lname, users_email, users_phone, users_photo "
                    + "FROM Users WHERE username = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                int userID = rs.getInt("users_id");
                String userFName = rs.getString("users_fname");
                String userLName = rs.getString("users_lname");
                String userEmail = rs.getString("users_email");
                String userPhone = rs.getString("users_phone");
                String userPhoto = rs.getString("users_photo");
                user = new UserDTO(userID, username, userFName, userLName, userEmail, userPhone, userPhoto);
            }
        } finally {
            closeConnection();
        }
        return user;
    }
    
    public ArrayList<UserDTO> searchByUserFName(String searchValue) throws Exception {
        ArrayList<UserDTO> userList = new ArrayList<>();
        try {
            con = MyConnection.getConnection();
            String sql = "SELECT users_id, [Users].[username], [Registrations].[roles], users_fname, users_lname, users_email, users_phone, users_photo "
                    + "FROM [Users] INNER JOIN [Registrations] " 
                    + "ON [Registrations].[username] = [Users].[username] " 
                    + "WHERE users_status = ? AND users_fname LIKE ?";
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, true);
            ps.setString(2, "%" + searchValue + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                int userID = rs.getInt("users_id");
                String username = rs.getString("username");
                String role = rs.getString(3);
                String userFName = rs.getString("users_fname");
                String userLName = rs.getString("users_lname");
                String userEmail = rs.getString("users_email");
                String userPhone = rs.getString("users_phone");
                String userPhoto = rs.getString("users_photo");
                UserDTO user = new UserDTO(userID, username, role, userFName, userLName, userEmail, userPhone, userPhoto, true);
                userList.add(user);
            }
        } finally {
            closeConnection();
        }
        return userList;
    }
    
    public boolean insertIntoRegistrations(RegistrationDTO regisInfo) throws Exception {
        boolean result = false;
        byte[] sha256Password = HashSHA256.getSHA(regisInfo.getPasswords());
        String passToHexString = HashSHA256.toHexString(sha256Password);
        try {
            con = MyConnection.getConnection();
            String sql = "INSERT INTO Registrations(username, passwords, roles) "
                    + "VALUES (?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, regisInfo.getUsername());
            ps.setString(2, passToHexString);
            ps.setString(3, "patron");
            result = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean insertIntoUsers(UserDTO user) throws Exception {
        boolean result = false;
        try {
            con = MyConnection.getConnection();
            String sql = "INSERT INTO Users(username, users_fname, users_lname, users_email, users_phone, users_photo, users_status) "
                    + "VALUES (?,?,?,?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getUserFname());
            ps.setString(3, user.getUserLname());
            ps.setString(4, user.getUserEmail());
            ps.setString(5, user.getUserPhone());
            ps.setString(6, user.getUserPhoto());
            ps.setBoolean(7, true);
            result = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean deleteUser(String username) throws Exception {
        boolean result = false;
        try {
            con = MyConnection.getConnection();
            String sql = "UPDATE Users SET users_status = ? WHERE username = ?";
            ps = con.prepareStatement(sql);
            ps.setBoolean(1, false);
            ps.setString(2, username);
            result = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
    
    public boolean updateUser(UserDTO user) throws Exception {
        boolean result = false;
        try {
            con = MyConnection.getConnection();
            String sql = "UPDATE Users " +
                "SET username = ?, users_fname = ?, users_lname = ?, users_email = ?, users_phone = ?, users_photo = ? " +
                "WHERE username = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getUserFname());
            ps.setString(3, user.getUserLname());
            ps.setString(4, user.getUserEmail());
            ps.setString(5, user.getUserPhone());
            ps.setString(6, user.getUserPhoto());
            ps.setString(7, user.getUsername());
            result = ps.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return result;
    }
}
