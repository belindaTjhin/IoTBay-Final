
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

public class QuantityUp extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int orderLineID = Integer.parseInt(request.getParameter("orderLineID"));
        int orderID = Integer.parseInt(session.getAttribute("orderID").toString());
        int productID = Integer.parseInt(request.getParameter("productID"));
        OrderLineDBManager manager = (OrderLineDBManager) session.getAttribute("orderLineManager");
        OrderDBManager orderManager = (OrderDBManager) session.getAttribute("orderManager");
        int orderId = Integer.parseInt(session.getAttribute("orderID").toString());
        String useremail = request.getParameter("email");
        try {
            Orderline orderLine = manager.findOrderLine(orderID, productID);
           orderLine.upQuantity();
            orderLine.setTotalPrice();
            manager.updateOrder(orderLineID, orderLine.getOrderID(), orderLine.getQuantity(), productID, orderLine.getProductName(), orderLine.getTotalPrice(), orderLine.getPrice());
            Orders order = orderManager.findOrder(orderId, useremail);
            order.updatePrice(orderLine.getPrice(), orderLine.getQuantity());
            request.getRequestDispatcher("OrderLineServlet").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(QuantityUp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    


}
