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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Product;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author btjhi
 */

public class UpdateDeviceServlet extends HttpServlet {
    private DBManager manager = null;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        manager = (DBManager) session.getAttribute("manager");
        
        int id;
        double price;
        int stock;
        
        
        try{
           id = Integer.parseInt(request.getParameter("id")); 
           price = Double.parseDouble(request.getParameter("price"));
           stock = Integer.parseInt(request.getParameter("stock"));
        } catch (NumberFormatException ex){
           session.setAttribute("added", "Error: Invalid number format.");
           response.sendRedirect("catalogue_add_device.jsp");
           return;
        }
        
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String supplier = request.getParameter("supplier");
        String oldName = request.getParameter("oldName");
        String newName = request.getParameter("newName");
        
        try{
            Product product = (Product) session.getAttribute("product");
            if(product != null){
                manager.updateDevice(id, newName, description, price, supplier, stock);
                // Update product object in the session
                product.setId(id);
                product.setName(newName);
                product.setDescription(description);
                product.setPrice(price);
                product.setSupplier(supplier);
                product.setStock(stock);
                session.setAttribute("product", product);
                session.setAttribute("updated", "Device details were successfully updated.");
                response.sendRedirect("catalogue_update_result.jsp");
            } else {
                session.setAttribute("updated", "Error: Update was not successful");
            }
        } catch (SQLException ex){
            //Log SQL exception
            Logger.getLogger(UpdateDeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("updated", "Error: " + ex.getMessage());
        } 
    }

}
