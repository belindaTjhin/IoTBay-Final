package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

@WebServlet(name = "CreateUserServlet", urlPatterns = {"/CreateUserServlet"})
public class CreateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        try {
            // Check if user already exists to avoid duplicate entries
            User exist = manager.findUser(email, password);
            if (exist != null) {
                session.setAttribute("existErr", "User already exists in the database.");
                response.sendRedirect("system_index.jsp"); // Redirect back to the form with an error message
            } else {
                // No existing user found, proceed to add new user
                manager.addUser(email, name, password, gender, address);
                User newUser = new User(email, name, password, gender, address);
                session.setAttribute("userCreated", "New user created successfully!");
                response.sendRedirect("system_index.jsp"); // Redirect to a list showing all users or confirmation page
            }
        } catch (SQLException ex) {
            // Log and handle exception
            session.setAttribute("createErr", "Failed to create user: " + ex.getMessage());
            response.sendRedirect("system_index.jsp"); // Redirect back to the form with an error message
        }
    }

    // If required, implement doGet for form presentation or redirect
    
}
