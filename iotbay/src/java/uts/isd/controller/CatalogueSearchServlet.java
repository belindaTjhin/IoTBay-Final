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
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        
        
        session.setAttribute("product", null);
        session.setAttribute("found", null);
        
        String deviceName = request.getParameter("deviceName");
        
        try{
            boolean check = manager.checkDevice(deviceName);
            if(check){
                Product product = manager.findDevice(deviceName);
                session.setAttribute("product", product);
                session.setAttribute("found", "Product found");
                request.getRequestDispatcher("catalogue_search.jsp").include(request, response);
                response.sendRedirect("catalogue_search_result.jsp");
            } else {
                request.getRequestDispatcher("catalogue_search.jsp").include(request, response);
                session.setAttribute("found", "Item does NOT exist in the Inventory");                
                response.sendRedirect("catalogue_search.jsp");
            }
        } catch (SQLException ex){
            Logger.getLogger(CatalogueSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("catalogue_search.jsp").include(request, response);
    }
    
}
