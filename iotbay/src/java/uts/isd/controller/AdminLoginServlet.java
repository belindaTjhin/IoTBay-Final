package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import uts.isd.model.Admin;
import uts.isd.model.dao.DBManager;

public class AdminLoginServlet extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       HttpSession session = request.getSession();
       Validator validator = new Validator();
       String email = request.getParameter("email");
       String password = request.getParameter("password");
       DBManager manager = (DBManager) session.getAttribute("manager");
       Admin admin = null;
       validator.clear(session);
       
       if(!validator.validateEmail(email)){
           session.setAttribute("emailErr", "Error: Email format incorrect");
           request.getRequestDispatcher("admin_login.jsp").include(request, response);
       } else if (!validator.validatePassword(password)){
           session.setAttribute("passErr", "Error: Password format incorrect");
           request.getRequestDispatcher("admin_login.jsp").include(request, response);
       } else {
           try{
               admin = manager.findAdmin(email, password);
               if(admin != null){
                   session.setAttribute("admin", admin);
                   request.getRequestDispatcher("admin_index.jsp").include(request, response);
               } else {
                   session.setAttribute("existErr", "Admin does not exist in the Database!");
                   request.getRequestDispatcher("admin_login.jsp").include(request, response);
               } 
           } catch (SQLException | NullPointerException ex){
               System.out.println(ex.getMessage() == null ? "Admin does not exist" : "welcome");
           }
       }
    }
}
