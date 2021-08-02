/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minh.dtos;

import java.io.Serializable;

/**
 *
 * @author IamDell
 */
public class RegistrationDTO implements Serializable {
    private String username;
    private String passwords;
    private String role;

    public RegistrationDTO() {
    }

    public RegistrationDTO(String username, String passwords, String role) {
        this.username = username;
        this.passwords = passwords;
        this.role = role;
    }

    public RegistrationDTO(String username, String role) {
        this.username = username;
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasswords() {
        return passwords;
    }

    public void setPasswords(String passwords) {
        this.passwords = passwords;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
}
