
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

public class GetOrderLines extends HttpServlet {

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int orderID = Integer.parseInt(request.getParameter("searchOrderID"));
        String useremail = request.getParameter("email");
        OrderDBManager orderManager = (OrderDBManager)session.getAttribute("orderManager");
        OrderLineDBManager manager = (OrderLineDBManager)session.getAttribute("orderLineManager");
        Orders order;
        
        try {
            order = orderManager.findOrder(orderID, useremail);
            request.setAttribute("order", order);
            ArrayList<Orderline> orderLines = manager.fetchOrders(orderID);
            request.setAttribute("orderLines", orderLines);
            request.getRequestDispatcher("searchOrderID.jsp").include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(GetOrderLines.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    

}
