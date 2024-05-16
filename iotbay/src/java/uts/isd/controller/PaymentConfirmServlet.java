/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Payment;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author yixia
 */
public class PaymentConfirmServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        Payment payment = (Payment) session.getAttribute("updatedPayment");

        String buttonValue = request.getParameter("paymentSubmitButton");
        try {

            switch (buttonValue) {
                case "Pay Now":
                    manager.finalisePayment(payment.getPaymentID());
                    request.getRequestDispatcher("payment_complete.jsp").forward(request, response);
                    break;
                case "Edit Payment Details":
                    request.getRequestDispatcher("payment_create.jsp").forward(request, response);
                    break;
                case "Cancel Payment":
                    manager.deletePayment(payment.getPaymentID());
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentConfirmServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
