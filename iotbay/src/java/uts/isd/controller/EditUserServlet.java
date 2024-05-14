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



@WebServlet(name = "EditUserServlet", urlPatterns = {"/EditUserServlet"})
public class EditUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String oldEmail = request.getParameter("oldEmail"); // Retrieve old email parameter
        String oldPassword = request.getParameter("oldPassword");
        
        System.out.println(email+" "+ password+" "+name+" "+gender+" "+address);// Retrieve new email parameter
        
        DBManager manager = (DBManager) session.getAttribute("manager");
        try{
            User user = manager.findUser(oldEmail, oldPassword);
            if(user != null){
                // Update user details in the database
                manager.updateUser(oldEmail, email, name, oldPassword, password, gender, address); // Pass old and new email
               
                request.getRequestDispatcher("system_index.jsp").include(request, response);
            } else{
                session.setAttribute("updated", "Error: Update was not successful");
                request.getRequestDispatcher("system_index.jsp").include(request,response);
            }
        } catch(SQLException ex){
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implement any necessary logic for handling GET requests, or simply forward to the doPost method
        doPost(request, response);
    }
}