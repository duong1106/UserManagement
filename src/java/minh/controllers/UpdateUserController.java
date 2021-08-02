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
import minh.daos.UserDAO;
import minh.dtos.UserDTO;

/**
 *
 * @author IamDell
 */
public class UpdateUserController extends HttpServlet {
    private final String INVALID = "user_profile.jsp";
    private final String SUCCESS = "GetUserProfileController";

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
        
        String url = INVALID;
        String username = request.getParameter("txtUsername");
        String userFname = request.getParameter("txtFname");
        String userLname = request.getParameter("txtLname");
        String userEmail = request.getParameter("txtEmail");
        String userPhone = request.getParameter("txtPhone");
        String userPhoto = request.getParameter("txtPhoto");
        String photoPath = "assets/avatar/" + userPhoto;
        boolean valid = true;
        
        try {
            if (username.isBlank()) {
                valid = false;
                request.setAttribute("INVALID", "Invalid inputs");
            }
            if (valid) {
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO(username, userFname, userLname, userEmail, userPhone, photoPath);
                boolean isUpdated = dao.updateUser(user);
                if (isUpdated) {
                    url = SUCCESS;
                    user = dao.getUserInfo(username);
                    request.setAttribute("UPDATESUCCESS", user);
                } else {
                    request.setAttribute("INVALID", "Update failed.");
                }
            } else {
                request.setAttribute("INVALID", "Invalid input, please try again.");
            }
        } catch (Exception e) {
            log("Error at UpdateUserController: " + e.getMessage());
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
