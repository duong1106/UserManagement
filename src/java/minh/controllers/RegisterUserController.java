/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minh.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import minh.daos.UserDAO;
import minh.dtos.RegistrationDTO;
import minh.dtos.UserDTO;

/**
 *
 * @author IamDell
 */
public class RegisterUserController extends HttpServlet {
    private final String INVALID = "registration.jsp";
    private final String SUCCESS = "index.jsp";

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
        String password = request.getParameter("txtPassword");
        String fname = request.getParameter("txtFname");
        String lname = request.getParameter("txtLname");
        String email = request.getParameter("txtEmail");
        String phone = request.getParameter("txtPhone");
        String photo = request.getParameter("txtPhoto");
        String photoPath = "assets/avatar/" + photo;
        boolean valid = true;
        try {
            if (username.isBlank() || password.isBlank()) {
                valid = false;
                request.setAttribute("INVALID", "Username or Password can't be blank");
            }
            if (valid) {
                UserDAO dao = new UserDAO();
                RegistrationDTO registration = new RegistrationDTO(username, password, "");
                UserDTO user = new UserDTO(username, fname, lname, email, phone, photoPath);
                boolean isRegitered = dao.insertIntoRegistrations(registration);
                if (isRegitered) {
                    boolean isInsertIntoUsers = dao.insertIntoUsers(user);
                    if (isInsertIntoUsers) {
                        url = SUCCESS;
                        request.setAttribute("ISREGISTERED", "Now you can login!");
                    }
                }
            }
        } catch (Exception e) {
            log("Error at RegisterUserController: " + e.getMessage());
            e.printStackTrace();
            if (e.getMessage().contains("duplicate")){
                request.setAttribute("INVALID", "Duplicate username");
                url = INVALID;
            }
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
