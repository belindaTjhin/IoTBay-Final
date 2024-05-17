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

@WebServlet(name = "CreateCustomerServlet", urlPatterns = {"/CreateCustomerServlet"})
public class CreateCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) getServletContext().getAttribute("manager");

        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String type = request.getParameter("type");

        try {
            manager.addCustomer(email, name, password, gender, address, type);
            session.setAttribute("customerCreated", "New customer created successfully!");
            response.sendRedirect("customer_list.jsp");
        } catch (SQLException ex) {
            session.setAttribute("createErr", "Failed to create customer: " + ex.getMessage());
            response.sendRedirect("customer_create.jsp");
        }
    }
}
