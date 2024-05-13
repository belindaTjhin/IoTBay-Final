package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.AccessLog;
import uts.isd.model.dao.DBManager;

@WebServlet(name = "AccessLogsServlet", urlPatterns = {"/AccessLogsServlet"})
public class AccessLogsServlet extends HttpServlet {
        
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        String email = (String) session.getAttribute("email");
        String date = request.getParameter("date");
        
        try {
            ArrayList<AccessLog> accessLogs;
            if (date != null && !date.isEmpty()) {
                accessLogs = manager.fetchAccessLog(email, date);
            } else {
                accessLogs = manager.fetchAccessLog(email,date);
            }
            session.setAttribute("accessLogs", accessLogs);
            request.getRequestDispatcher("user_access_logs.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AccessLogsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
