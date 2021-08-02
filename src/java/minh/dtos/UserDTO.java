/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minh.dtos;

import java.io.Serializable;
import minh.dtos.RegistrationDTO;

/**
 *
 * @author IamDell
 */
public class UserDTO implements Serializable {
    private int userID;
    private String username;
    private String role;
    private String userFname;
    private String userLname;
    private String userEmail;
    private String userPhone;
    private String userPhoto;
    private boolean userStatus;
    

    public UserDTO(int userID, String username, String role, String userFname, String userLname, String userEmail, String userPhone, String userPhoto, boolean userStatus) {
        this.userID = userID;
        this.username = username;
        this.role = role;
        this.userFname = userFname;
        this.userLname = userLname;
        this.userEmail = userEmail;
        this.userPhone = userPhone;
        this.userPhoto = userPhoto;
        this.userStatus = userStatus;
    }

    public UserDTO(int userID, String username, String userFname, String userLname, String userEmail, String userPhone, String userPhoto) {
        this.userID = userID;
        this.username = username;
        this.userFname = userFname;
        this.userLname = userLname;
        this.userEmail = userEmail;
        this.userPhone = userPhone;
        this.userPhoto = userPhoto;
    }

    public UserDTO(String username, String userFname, String userLname, String userEmail, String userPhone, String userPhoto) {
        this.username = username;
        this.userFname = userFname;
        this.userLname = userLname;
        this.userEmail = userEmail;
        this.userPhone = userPhone;
        this.userPhoto = userPhoto;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserFname() {
        return userFname;
    }

    public void setUserFname(String userFname) {
        this.userFname = userFname;
    }

    public String getUserLname() {
        return userLname;
    }

    public void setUserLname(String userLname) {
        this.userLname = userLname;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserPhoto() {
        return userPhoto;
    }

    public void setUserPhoto(String userPhoto) {
        this.userPhoto = userPhoto;
    }

    public boolean isUserStatus() {
        return userStatus;
    }

    public void setUserStatus(boolean userStatus) {
        this.userStatus = userStatus;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
