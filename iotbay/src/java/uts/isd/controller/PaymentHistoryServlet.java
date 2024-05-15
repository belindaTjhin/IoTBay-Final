/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import uts.isd.model.Payment;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author yixia
 */
public class PaymentHistoryServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        User user = (User)session.getAttribute("user");
        String email = user.getEmail();
        List<Payment> payments;
        try{
            payments = manager.fetchPayment(email);
            if(payments != null){
                session.setAttribute("payments", payments);
                request.getRequestDispatcher("payment_list.jsp").include(request, response);
                session.setAttribute("title", "Your Payment History");
                response.sendRedirect("payment_list.jsp");
            } else{
                request.getRequestDispatcher("payment_list.jsp").include(request, response);
                session.setAttribute("title", "No payment history to show.");
                response.sendRedirect("payment_list.jsp");
            }
        }catch (SQLException ex){
            Logger.getLogger(PaymentHistoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }
}
