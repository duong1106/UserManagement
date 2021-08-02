/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minh.dtos;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author IamDell
 */
public class PromotionListDTO implements Serializable {
    private String promoteCode;
    private double promoteRank;
    private Date promoteDate;
    private String userID;

    public PromotionListDTO() {
    }

    public PromotionListDTO(String promoteCode, double promoteRank, Date promoteDate, String userID) {
        this.promoteCode = promoteCode;
        this.promoteRank = promoteRank;
        this.promoteDate = promoteDate;
        this.userID = userID;
    }

    public String getPromoteCode() {
        return promoteCode;
    }

    public void setPromoteCode(String promoteCode) {
        this.promoteCode = promoteCode;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }
    
    public double getPromoteRank() {
        return promoteRank;
    }

    public void setPromoteRank(double promoteRank) {
        this.promoteRank = promoteRank;
    }

    public Date getPromoteDate() {
        return promoteDate;
    }

    public void setPromoteDate(Date promoteDate) {
        this.promoteDate = promoteDate;
    }
    
}
