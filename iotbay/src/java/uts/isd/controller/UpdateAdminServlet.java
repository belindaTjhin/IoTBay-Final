/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Admin;


/**
 *
 * @author zoe10
 */
@WebServlet(name = "UpdateAdminServlet", urlPatterns = {"/UpdateAdminServlet"})
public class UpdateAdminServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        Admin admin = new Admin(email, name, password, gender, address);
       
        DBManager manager = (DBManager) session.getAttribute("manager");
        try{
            admin = manager.findAdmin(email, password);
            if(admin != null){
                session.setAttribute("updated", "Update was successful");
                request.getRequestDispatcher("edit_admin.jsp").include(request, response);
            } else{
                session.setAttribute("updated", "Update was not successful");
                request.getRequestDispatcher("edit_admin.jsp").include(request,response);
            }
        } catch(SQLException ex){
            Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("edit_admin.jsp");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implement any necessary logic for handling GET requests, or simply forward to the doPost method
        doPost(request, response);
    }
    
}