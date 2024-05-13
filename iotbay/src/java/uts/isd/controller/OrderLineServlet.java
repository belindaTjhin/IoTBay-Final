package uts.isd.controller;

import uts.isd.model.Orderline;
import uts.isd.model.Orders;
import uts.isd.model.dao.OrderDBManager;
import uts.isd.model.dao.OrderLineDBManager;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderLineServlet extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        OrderLineDBManager manager = (OrderLineDBManager) session.getAttribute("orderLineManager");
        OrderDBManager orderManager = (OrderDBManager) session.getAttribute("orderManager");
        int orderID = Integer.parseInt(session.getAttribute("orderID").toString());
        String useremail = request.getParameter("email");
        try {
            ArrayList<Orderline> orderLines = manager.fetchOrders(orderID);
            session.setAttribute("orderLines", orderLines);
            Orders order = orderManager.findOrder(orderID, useremail);
            double totalPrice = 0;
            for (Orderline orderLine : orderLines) {
                totalPrice = totalPrice + orderLine.getTotalPrice();
            }
            order.setTotalPrice(totalPrice);
            session.setAttribute("order", order);
            request.getRequestDispatcher("cart.jsp").include(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(OrderLineServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}
