/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class PaymentSearchServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dateString = request.getParameter("date");
        System.out.println(dateString);

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date javaDate = null;
        int paymentID = 0;
        try {
            paymentID = Integer.parseInt(request.getParameter("paymentID"));
            javaDate = format.parse(dateString);
        } catch (NumberFormatException | ParseException e) {
            Logger.getLogger(PaymentSearchServlet.class.getName()).log(Level.SEVERE, null, e);
        }
        request.setAttribute("paymentID", paymentID);
        request.setAttribute("date", javaDate);

        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");

        User user = (User) session.getAttribute("user");
        String email = user.getEmail();
        try {
            Payment payment = manager.findPayment(paymentID, javaDate);
            session.setAttribute("payment", payment);
            request.getRequestDispatcher("payment_search_result.jsp").include(request, response);
            response.sendRedirect("payment_search_result.jsp");

        } catch (SQLException ex) {
            Logger.getLogger(PaymentHistoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
