package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Orderline;
import uts.isd.model.dao.DBManager;

public class OrderLineSearchServlet extends HttpServlet {
    private DBManager manager = null;
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        manager = (DBManager) session.getAttribute("manager");

        if (manager == null) {
            System.err.println("DBManager is not set in the session.");
            request.setAttribute("found", "DBManager is not set in the session.");
            request.getRequestDispatcher("OrderLineSearch.jsp").forward(request, response);
            return;
        }

        try {
            int orderlineid = Integer.parseInt(request.getParameter("orderlineID"));
            
            boolean check = manager.checkorderline(orderlineid);
            if (check) {
                Orderline orderline = manager.findorderline(orderlineid);
                request.setAttribute("orderline", orderline);
                request.setAttribute("found", "Item was found");
            } else {
                request.setAttribute("found", "Item does NOT exist in the Inventory");
                request.setAttribute("orderline", null);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderLineSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("found", "SQL Error: " + ex.getMessage());
        } catch (NumberFormatException ex) {
            request.setAttribute("found", "Invalid Orderline ID format.");
        }
        request.getRequestDispatcher("OrderLineSearch.jsp").forward(request, response);
    }
}
