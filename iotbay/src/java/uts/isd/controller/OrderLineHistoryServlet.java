
package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Orderline;
import uts.isd.model.dao.DBManager;
import uts.isd.model.Orders;

public class OrderLineHistoryServlet extends HttpServlet {
    



protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

 HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
Orders orders = (Orders)session.getAttribute("orders");


int orderID =orders.getOrderID();
List<Orderline> orderlines;

try{
    orderlines = manager.fetchOrderLine(orderID);
    if(orderlines != null){
    session.setAttribute("orderlines", orderlines);
    request.getRequestDispatcher("orderline_list.jsp").include(request, response);
    session.setAttribute("title", "Your Orderline History");
    response.sendRedirect("orderline_list.jsp");
    } else{
    request.getRequestDispatcher("orderline_list.jsp").include(request, response);
    session.setAttribute("title", "No Orderline history to show.");
     response.sendRedirect("orderline_list.jsp");
    }
    }catch (SQLException ex){
    Logger.getLogger(OrderLineHistoryServlet.class.getName()).log(Level.SEVERE, null, ex);   
    } 
}
}