package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Product;
import uts.isd.model.dao.DBManager;

public class AddDeviceServlet extends HttpServlet {
    private DBManager manager = null;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //session
        HttpSession session = request.getSession();
        manager = (DBManager) session.getAttribute("manager");

        //parameters from jsp
        int id;
        double price;
        int stock;
        try {
            id = Integer.parseInt(request.getParameter("id"));
            price = Double.parseDouble(request.getParameter("price"));
            stock = Integer.parseInt(request.getParameter("stock"));
        } catch (NumberFormatException ex) {
            // Handle invalid number format
            session.setAttribute("added", "Error: Invalid number format.");
            response.sendRedirect("catalogue_add_device.jsp");
            return;
        }
        
        String name = request.getParameter("productName");
        String description = request.getParameter("description");
        String supplier = request.getParameter("supplier");

        // Create a Product object with the constructor
        Product product = new Product(id, name, description, price, supplier, stock);

        try {
            Product exist = manager.findDevice(name);
            if (exist != null) {
                session.setAttribute("existErr", "Product already exists in the database.");
                session.setAttribute("added", "Item was not added to the Catalogue.");
            } else {
                // Store the Product object in the session
                session.setAttribute("newProduct", product);
                manager.addDevice(id, name, description, price, supplier, stock);
                session.setAttribute("added", "Item has been added to Catalogue.");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddDeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("added", "Error: " + ex.getMessage());
        }

        // Redirect the request to the catalogue_add_device.jsp page
        response.sendRedirect("catalogue_add_device.jsp");
    }
}
