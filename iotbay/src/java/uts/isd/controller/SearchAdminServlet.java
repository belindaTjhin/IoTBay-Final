package uts.isd.controller;
import java.util.ArrayList;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import uts.isd.model.Admin;
import uts.isd.model.dao.DBManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SearchAdminServlet", urlPatterns = {"/SearchAdminServlet"})
public class SearchAdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");

        String searchName = request.getParameter("name");
        String searchEmail = request.getParameter("email");

        try {
            ArrayList<Admin> allUsers = manager.fetchAdmin(); // Fetch all users
            ArrayList<Admin> filteredUsers = new ArrayList<>();

            // Filter users based on name and phone number
            for (Admin user : allUsers) {
                if ((searchName == null || user.getName().toLowerCase().contains(searchName.toLowerCase())) &&
                    (searchEmail == null || user.getEmail().contains(searchEmail))) {
                    filteredUsers.add(user);
                }
            }

            session.setAttribute("searchResults", filteredUsers);
            request.getRequestDispatcher("system_searchAdmins.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving admins: " + e.getMessage());
            request.getRequestDispatcher("system_index.jsp").forward(request, response);
        }
    }
}
