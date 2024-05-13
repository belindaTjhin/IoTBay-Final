package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Admin;
import uts.isd.model.dao.DBManager;

@WebServlet(name = "EditUserAdminServlet", urlPatterns = {"/EditUserAdminServlet"})
public class EditUserAdminServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");
    String password = request.getParameter("password"); // Get the new password

    try {
        // Assuming you have a method in your DBManager to update a user
        DBManager manager = (DBManager) getServletContext().getAttribute("manager");
        if (password != null && !password.isEmpty()) {
            // Optionally hash the password here before saving, depending on your security requirements
            System.out.println(email);
            System.out.println(name);
            System.out.println(password);
            System.out.println(gender);
            System.out.println(address);
            
            manager.updateAdmin(email, name, password, gender, address); // Update user with new password
        } 
        else {
            manager.updateAdmin(email, name, null, gender, address); // Update user without changing password
        }
        response.sendRedirect("system_viewusers.jsp"); // Redirect to user list or confirmation page
    } catch (SQLException e) {
        throw new ServletException("Error updating user", e);
    }
}

}
