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
import uts.isd.model.Product;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;

/**
 *
 * @author btjhi
 */
public class AddDeviceServlet extends HttpServlet {
    private DBManager manager = null;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddDeviceServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddDeviceServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //session
        HttpSession session = request.getSession();
        manager = (DBManager) session.getAttribute("manager");
        
        //parameters from jsp
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("productName");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String supplier = request.getParameter("supplier");
        int stock = Integer.parseInt(request.getParameter("stock"));
        
        if(name != null){
            try{
            Product exist = manager.findDevice(name);
                if(exist!=null){
                    session.setAttribute("existErr", "Product already exists in the database.");
                    session.setAttribute("added", "Item was not added to the Catalogue.");
                } else {
                    manager.addDevice(id, name, description, price, supplier, stock);
                    session.setAttribute("added", "Item has been added to Catalogue.");
                    request.getRequestDispatcher("catalogue_add_device.jsp").include(request, response);
                }
            } catch (SQLException ex){
                Logger.getLogger(AddDeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } 
       
    }


}
