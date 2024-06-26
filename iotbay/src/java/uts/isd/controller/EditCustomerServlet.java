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

@WebServlet(name = "EditCustomerServlet", urlPatterns = {"/EditCustomerServlet"})
public class EditCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");

        try {
            String oldEmail = request.getParameter("oldEmail");
            String newEmail = request.getParameter("newEmail");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String type = request.getParameter("type");
            manager.updateCustomer(oldEmail, newEmail, name, address, type);
            response.sendRedirect("ViewCustomerServlet");
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error: " + e.getMessage());
            response.sendRedirect("system_index.jsp");
        }
    }
}
