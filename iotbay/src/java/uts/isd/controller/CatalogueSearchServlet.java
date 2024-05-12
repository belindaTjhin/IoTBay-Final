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
public class CatalogueSearchServlet extends HttpServlet {
    
    private DBManager manager;
    private DBConnector connector;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        try{
            connector = new DBConnector();
        } catch (ClassNotFoundException | SQLException ex){
            java.util.logging.Logger.getLogger(CatalogueSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try{
            manager = new DBManager(connector.openConnection());
        } catch (SQLException ex){
            java.util.logging.Logger.getLogger(CatalogueSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        //session
        HttpSession session = request.getSession();
        
        session.setAttribute("product", null);
        session.setAttribute("found", null);
        
        String deviceName = request.getParameter("deviceName");
        
        try{
            boolean check = manager.checkDevice(deviceName);
            if(check){
                Product product = manager.findDevice(deviceName);
                session.setAttribute("product", product);
                
                request.getRequestDispatcher("catalogue_search.jsp").include(request, response);
                response.sendRedirect("catalogue_search_result.jsp");
            } else {
                request.getRequestDispatcher("catalogue_search.jsp").include(request, response);
                session.setAttribute("found", "Item does NOT exist in the Inventory");                
                response.sendRedirect("catalogue_search.jsp.jsp");
            }
        } catch (SQLException ex){
            Logger.getLogger(CatalogueSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
