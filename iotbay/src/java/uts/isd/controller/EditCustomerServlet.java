package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Customer;
import uts.isd.model.dao.DBManager;

@WebServlet(name = "EditCustomerServlet", urlPatterns = {"/EditCustomerServlet"})
public class EditCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) getServletContext().getAttribute("manager");
        int customerId = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String type = request.getParameter("type");

        try {
            Customer customer = manager.findCustomer(customerId);
            if (customer != null) {
                customer.setEmail(email);
                customer.setName(name);
                customer.setPassword(password);
                customer.setGender(gender);
                customer.setAddress(address);
                customer.setType(type);
                manager.updateCustomer(customer);
                session.setAttribute("customer", customer);
                response.sendRedirect("customer_list.jsp");
            } else {
                session.setAttribute("editErr", "Customer not found.");
                response.sendRedirect("customer_list.jsp");
            }
        } catch (SQLException ex) {
            session.setAttribute("editErr", "Failed to edit customer: " + ex.getMessage());
            response.sendRedirect("customer_list.jsp");
        }
    }
}
