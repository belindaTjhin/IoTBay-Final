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


/**
 *
 * @author zoe10
 */
@WebServlet(name = "UpdateServlet", urlPatterns = {"/UpdateServlet"})
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String oldEmail = request.getParameter("oldEmail"); // Retrieve old email parameter
        String newEmail = request.getParameter("newEmail"); // Retrieve new email parameter
        String oldPassword = request.getParameter("oldPassword"); // Retrieve old email parameter
        String newPassword = request.getParameter("newPassword"); // Retrieve new email parameter
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        // Clear previous error messages
        validator.clear(session);
        // Validate user input
        if (!validator.validateEmail(newEmail)) {
            session.setAttribute("emailErr", "Error: Email is either already in the database or format is incorrect.");
            request.getRequestDispatcher("edit_user.jsp").include(request, response);
        } else if (!validator.validateName(name)) {

            session.setAttribute("nameErr", "Error: First and last names need to be capitalised.");

            request.getRequestDispatcher("edit_user.jsp").include(request, response);
        } else if (!validator.validatePassword(newPassword)) {
            session.setAttribute("passErr", "Error: Password needs to be more than 3 characters long.");
            request.getRequestDispatcher("edit_user.jsp").include(request, response);
        } else {
            try {
                User user = manager.findUser(email, password);
                if (user != null) {
                    // Update user details in the database
                    manager.updateUser(oldEmail, newEmail, name, oldPassword, newPassword, gender, address); // Pass old and new email
                    // Redirect user to update page after successful update
                    session.setAttribute("updated", "");
                    // Update user object in the session
                    user.setName(name);
                    user.setEmail(newEmail);
                    user.setPassword(newPassword);
                    user.setGender(gender);
                    user.setAddress(address);
                    session.setAttribute("user", user);
                    request.getRequestDispatcher("update_user.jsp").include(request, response);
                } else {

                    session.setAttribute("updated", "Error: Update was not successful. Email is already in the database.");

                    request.getRequestDispatcher("edit_user.jsp").include(request,response);
                }
            } catch (SQLException ex) {
                // Log SQL exceptions
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implement any necessary logic for handling GET requests, or simply forward to the doPost method
        doPost(request, response);
    }
}
