/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
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
public class PaymentCreateServlet extends HttpServlet {

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
//        DBManager manager = new DBManager();

        User user = (User) session.getAttribute("user");

        String orderIDString = request.getParameter("orderID");
        String cHName = request.getParameter("cardHolderName");
        String cNumber = request.getParameter("cardNumber");
        String cExMMYY = request.getParameter("cardExpiryMMYY");
        String cCVC = request.getParameter("cardCVC");
        String email = "";

        if (user != null) {
            email = user.getEmail();
        }
        java.util.Date date = new Date();

        PaymentValidator validator = new PaymentValidator();

        validator.clear(session);

        boolean invalidInput = false;

        if (!validator.validateOrderID(orderIDString)) {
            session.setAttribute("orderIDFErr", "Error: Incorrect format. Ex:15");
            invalidInput = true;
        }
//        if (!validator.validateCardHolderName(cHName)) {
//            session.setAttribute("cardHNameFErr", "Error: Incorrect format. Ex: John Smith");
//            invalidInput = true;
//        }
        if (!validator.validateCardNumber(cNumber)) {
            session.setAttribute("cardNumberFErr", "Error: Incorrect format. Ex:5217847282940274");
            invalidInput = true;
        }
        if (!validator.validateCardExpiryMMYY(cExMMYY)) {
            session.setAttribute("expiryFError", "Error: Incorrect format. Ex:08/25");
            invalidInput = true;
        }
        if (!validator.validateCardCVC(cCVC)) {
            session.setAttribute("cvvErr", "Error: Incorrect format. Ex:357");
            invalidInput = true;
        }
        if (invalidInput) {
            request.getRequestDispatcher("payment_create.jsp").forward(request, response);
            return;
        } else {
            int orderID = 0;
            int paymentID = 0;
            try {
                orderID = Integer.parseInt(orderIDString);
                paymentID = orderID;
            } catch (NumberFormatException e) {

            }

            try {
                // Check if order exists
                if (!manager.orderExist(orderID)) {
                    session.setAttribute("orderNotExistErr", "No matching order id found.");
                    request.getRequestDispatcher("payment_create.jsp").forward(request, response);
                }
                Payment payment = manager.findPayment(orderID);

                //if payment exists
                if (payment != null) {
                    //if payment exists and is finalised
                    if (payment.isFinalised()) {
                        session.setAttribute("paymentErr", "Error: This payment has been finalised.");
                        request.getRequestDispatcher("payment_create.jsp").forward(request, response);
                        //if payment exists and is not finalised, update the details
                    } else {
                        manager.updatePayment(paymentID, orderID, email, date, cHName, cNumber, cCVC, cExMMYY, false);
                        Payment updatedPayment = manager.findPayment(orderID);
                        session.setAttribute("updatedPayment", updatedPayment);
                        request.getRequestDispatcher("payment_view.jsp").forward(request, response); // Redirect to a list showing all admin or confirmation page
                    }
                    //if payment does not exist
                } else {
                    manager.addPayment(paymentID, orderID, email, date, cHName, cNumber, cCVC, cExMMYY, false);
                    Payment newPayment = new Payment(paymentID, orderID, email, date, cHName, cNumber, cCVC, cExMMYY, false);
                    session.setAttribute("updatedPayment", newPayment);
                    request.getRequestDispatcher("payment_view.jsp").forward(request, response); // Redirect to a list showing all admin or confirmation page
                }
            } catch (SQLException ex) {
                // Log and handle exception
                session.setAttribute("createPaymentErr", "Failed to create payment: " + ex.getMessage());
                response.sendRedirect("payment_create.jsp"); // Redirect back to the form with an error message
            }
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
}
