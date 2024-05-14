
package uts.isd.controller;

import uts.isd.model.Orders;
import uts.isd.model.dao.OrderDBManager;
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

/**
 *
 * @author tayla
 */
public class OrderHistory extends HttpServlet {

    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int orderID = Integer.parseInt(session.getAttribute("orderID").toString());
        String useremail = request.getParameter("email");
        OrderDBManager orderManager = (OrderDBManager)session.getAttribute("orderManager");
        try {
            ArrayList<Orders> orders = orderManager.fetchOrders(useremail);
            session.setAttribute("orders", orders);
            request.getRequestDispatcher("viewOrderHistory.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(OrderHistory.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    

}
