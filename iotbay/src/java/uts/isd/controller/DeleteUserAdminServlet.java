package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.DBManager;

@WebServlet(name = "DeleteUserAdminServlet", urlPatterns = {"/DeleteUserAdminServlet"})
public class DeleteUserAdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the email to delete
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");

        try {
            // Perform the deletion
            manager.deleteAdmin(email);
            session.setAttribute("deleteMsg", "User with email " + email + " has been successfully deleted.");
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("deleteMsg", "Error deleting user: " + e.getMessage());
        }

        // Redirect to the user list page or where you display messages
        response.sendRedirect("system_index.jsp"); // Change 'userList.jsp' to your actual page
    }
}
