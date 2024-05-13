package uts.isd.controller;

import uts.isd.model.Orderline;
import uts.isd.model.Orders;
import uts.isd.model.dao.OrderDBManager;
import uts.isd.model.dao.OrderLineDBManager;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderServlet extends HttpServlet{
    
    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
        HttpSession session = request.getSession();
        String useremail = request.getParameter("email"); // Get the userID
        
        OrderDBManager manager = (OrderDBManager) session.getAttribute("orderManager");
        Orders order = new Orders(useremail); //Use the userID to create a unique orderID
        int orderID = order.getOrderID();
        try {
            manager.addOrder(orderID, useremail);
        } 
        catch (SQLException ex) {
            Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        session.setAttribute("orderID", orderID);
        request.getRequestDispatcher("product.jsp").include(request, response);
        
    }

}