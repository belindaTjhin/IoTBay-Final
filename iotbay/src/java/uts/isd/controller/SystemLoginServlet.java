package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import uts.isd.model.System;
import uts.isd.model.dao.DBManager;

public class SystemLoginServlet extends HttpServlet{
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       HttpSession session = request.getSession();
       Validator validator = new Validator();
       String email = request.getParameter("email");
       String password = request.getParameter("password");
       DBManager manager = (DBManager) session.getAttribute("manager");
       System system = null;
       validator.clear(session);
       
       if(!validator.validateEmail(email)){
           session.setAttribute("emailErr", "Error: Email format incorrect");
           request.getRequestDispatcher("system_login.jsp").include(request, response);
       } else if (!validator.validatePassword(password)){
           session.setAttribute("passErr", "Error: Password format incorrect");
           request.getRequestDispatcher("system_login.jsp").include(request, response);
       } else {
           try{
               system = manager.findSystem(email, password);
               if(system != null){
                   session.setAttribute("system", system);
                   // Log system access
                    String loginTime = new Timestamp(java.lang.System.currentTimeMillis()).toString();
                    session.setAttribute("loginTime", loginTime);
                    session.setAttribute("email", email);
                    session.setAttribute("password", password);

                   request.getRequestDispatcher("system_index.jsp").include(request, response);
               } else {
                   session.setAttribute("existErr", "system does not exist in the Database!");
                   request.getRequestDispatcher("system_login.jsp").include(request, response);
               } 
           } catch (SQLException | NullPointerException ex){
               java.lang.System.out.println(ex.getMessage() == null ? "System does not exist" : "welcome");
           }
       }
    }
}
