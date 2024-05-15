package uts.isd.controller;

import uts.isd.model.Orders;
import uts.isd.model.dao.OrderDBManager;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderServlet extends HttpServlet {
    
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
        HttpSession session = request.getSession();
        String userEmail = request.getParameter("email"); // Get the user email
        
        // Check if the orderManager is in the session
        OrderDBManager manager = (OrderDBManager) session.getAttribute("orderManager");
        if (manager == null) {
            // Handle the case where the orderManager is not found in the session
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Order manager not found in session.");
            return;
        }
        
        try {
            // Generate a unique orderID using OrderDBManager
            int orderID = manager.getNextOrderID();
            
            // Create a new Orders object
            Date orderDate = new Date(); // Assuming current date as the order date
            Orders order = new Orders(orderID, userEmail, orderDate, BigDecimal.ZERO, ""); // Initialize with default values
            
            // Add the order to the database
            manager.addOrder(order);
            
            // Set the orderID in the session
            session.setAttribute("orderID", orderID);
            
            // Forward to the product.jsp page
            request.getRequestDispatcher("product.jsp").include(request, response);
        } catch (SQLException ex) {
            // Log the exception and handle it
            Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error while adding order.");
        }
    }
}
