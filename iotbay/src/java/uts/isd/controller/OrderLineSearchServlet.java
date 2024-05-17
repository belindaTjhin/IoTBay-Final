package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Orderline;
import uts.isd.model.Orders;
import uts.isd.model.dao.DBManager;
import java.util.List;

public class OrderLineSearchServlet extends HttpServlet {    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
              
        int orderlineid = 0;
        try {
            orderlineid = Integer.parseInt(request.getParameter("orderlineid"));
        } catch (NumberFormatException e) {
          Logger.getLogger(PaymentSearchServlet.class.getName()).log(Level.SEVERE, null, e);  
        }
        request.setAttribute("orderlineid", orderlineid);
         
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
         
        Orders orders = (Orders)session.getAttribute("orders");
        try {
            Orderline orderline = manager.findorderline(orderlineid);
            session.setAttribute("orderlineid", orderlineid);
            request.getRequestDispatcher("OrderLineSearch_result.jsp").include(request, response);
            response.sendRedirect("OrderLineSearch_result.jsp");
        } catch (SQLException ex) {
          Logger.getLogger(PaymentHistoryServlet.class.getName()).log(Level.SEVERE, null, ex);  
        }
    } 
}
