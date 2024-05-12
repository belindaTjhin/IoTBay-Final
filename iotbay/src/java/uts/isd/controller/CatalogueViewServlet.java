/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class CatalogueViewServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
       
        
        try{
            ArrayList<Product> catalogue = manager.fetchDevice();
            if(catalogue != null){
                session.setAttribute("catalogue", catalogue);
                request.getRequestDispatcher("catalogue.jsp").include(request, response);
                session.setAttribute("show", "IoTBayCatalogue");
                response.sendRedirect("catalogue.jsp");
            } else {
                request.getRequestDispatcher("catalogue.jsp").include(request, response);
                session.setAttribute("show", "Catalogue does not exist");
                response.sendRedirect("catalogue.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CatalogueViewServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
