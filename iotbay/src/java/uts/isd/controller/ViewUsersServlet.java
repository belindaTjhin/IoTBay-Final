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
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

@WebServlet(name = "ViewUsersServlet", urlPatterns = {"/ViewUsersServlet"})
public class ViewUsersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");

        try {
            ArrayList<User> users = manager.fetchUser(); // Assume this method exists and fetches all users
            session.setAttribute("usersList", users);
            request.getRequestDispatcher("system_viewusers.jsp").forward(request, response); // Forward to JSP that displays users
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
            request.setAttribute("errorMessage", "Error retrieving users: " + e.getMessage());
            request.getRequestDispatcher("system_index.jsp").forward(request, response); // Forward to an error page
        }
    }
}
