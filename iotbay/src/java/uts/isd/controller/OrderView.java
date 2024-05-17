
package uts.isd.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Orders;
import uts.isd.model.dao.OrderDBManager;
public class OrderView  extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        HttpSession session = request.getSession();
        OrderDBManager Omanager = (OrderDBManager) session.getAttribute("Omanager");
        
    try{
            ArrayList<Orders> orderview = Omanager.fetchOrder();
            if(orderview != null){
                session.setAttribute("orderview", orderview);
                request.getRequestDispatcher("OrderForm.jsp").include(request, response);
                session.setAttribute("show", "orderView");
                response.sendRedirect("OrderForm.jsp");
            } else {
                request.getRequestDispatcher("OrderFOrm.jsp").include(request, response);
                session.setAttribute("show", "Order does not exist");
                response.sendRedirect("OrderForm.jsp");
            }
    } catch (SQLException ex) {
            Logger.getLogger(SubmitOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        
    }
               
                
            }
}
