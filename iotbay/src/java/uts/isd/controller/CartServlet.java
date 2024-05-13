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


public class CartServlet extends HttpServlet {

    @Override   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)   throws ServletException, IOException {       
        HttpSession session = request.getSession();
        int productID = Integer.parseInt(request.getParameter("productID").toString());
        String useremail = request.getParameter("email");
        String productName = request.getParameter("productName");
        int orderID = Integer.parseInt(session.getAttribute("orderID").toString());
        double price =  Double.parseDouble(request.getParameter("price"));
        OrderLineDBManager manager = (OrderLineDBManager) session.getAttribute("orderLineManager");
        OrderDBManager orderManager = (OrderDBManager) session.getAttribute("orderManager");
        Orderline orderLine = new Orderline();
        
        
          
        try {
            orderLine = manager.findOrderLine(orderID, productID);
            if (orderLine == null) {
                orderLine = new Orderline(orderID, 1, productID, productName, price);
                int orderLineID = orderLine.getOrderlineID();
                manager.addOrderLine(orderLineID,orderID,1,productID,productName, price, price);
                Orders order = orderManager.findOrder(orderID, useremail);
                order.updatePrice(price, 1);
                request.getRequestDispatcher("product.jsp").include(request, response);
            }
            else {
                int orderLineID = orderLine.getOrderlineID();
                orderLine.upQuantity();
                manager.updateOrder(orderLineID, orderID, orderLine.getQuantity(), productID, productName, orderLine.getTotalPrice(), price);
                Orders order = orderManager.findOrder(orderID, useremail);
                order.updatePrice(price, orderLine.getQuantity());
                request.getRequestDispatcher("product.jsp").include(request, response);
            }
            
            
        
        } catch (SQLException ex) {
            Logger.getLogger(CartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
            
            
           
        
        
        }

}
