package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.DBManager;

@WebServlet(name = "DeleteCustomerServlet", urlPatterns = {"/DeleteCustomerServlet"})
public class DeleteCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) getServletContext().getAttribute("manager");
        int customerId = Integer.parseInt(request.getParameter("id"));

        try {
            manager.deleteCustomerRecord(customerId);  // Assuming deleteCustomerRecord is the method that deletes only the customer record
            session.setAttribute("customerDeleted", "Customer record deleted successfully!");
            response.sendRedirect("customer_list.jsp");
        } catch (SQLException ex) {
            session.setAttribute("deleteErr", "Failed to delete customer record: " + ex.getMessage());
            response.sendRedirect("customer_list.jsp");
        }
    }
}
