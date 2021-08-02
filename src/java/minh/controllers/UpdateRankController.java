/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minh.controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import minh.daos.PromotionDAO;
import minh.utility.checkIsNumeric;

/**
 *
 * @author IamDell
 */
public class UpdateRankController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = "GetPromotionListController";
        String userID = request.getParameter("userID");
        String promoteRank = request.getParameter("promoteRank");
        boolean valid = true;
        try {
            if (!checkIsNumeric.onlyDigits(promoteRank)) {
                valid = false;
                request.setAttribute("INVALID", "Rank can only be numeric.");
            }
            if (Double.parseDouble(promoteRank) < 0 || Double.parseDouble(promoteRank) > 10) {
                valid = false;
                request.setAttribute("INVALID", "Rank must be between 0 - 10.");
            }
            if (valid) {
                PromotionDAO dao = new PromotionDAO();
                boolean isUpdated = dao.updateRank(userID, promoteRank);
                if (isUpdated) {
                    request.setAttribute("ISUPDATED", "User rank has been updated.");
                } else {
                    request.setAttribute("INVALID", "Update failed.");
                }
            } 
                
        } catch (Exception e) {
            log("Error at DemoteUserController: " + e.getMessage());
            e.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
