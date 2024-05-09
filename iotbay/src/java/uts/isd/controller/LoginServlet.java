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
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        DBManager manager = (DBManager) session.getAttribute("manager");
        User user = null;
        validator.clear(session);
        
        if(!validator.validateEmail(email)){
           session.setAttribute("emailErr", "Error: Email format incorrect");
           request.getRequestDispatcher("login.jsp").include(request, response);
       } else if (!validator.validatePassword(password)){
           session.setAttribute("passErr", "Error: Password format incorrect");
           request.getRequestDispatcher("login.jsp").include(request, response);
       } else {
           try{
               user = manager.findUser(email, password);
               if(user != null){
                   session.setAttribute("user", user);
                   request.getRequestDispatcher("one.jsp").include(request, response);
               } else {
                   session.setAttribute("existErr", "User does not exist in the Database!");
                   request.getRequestDispatcher("login.jsp").include(request, response);
               } 
           } catch (SQLException | NullPointerException ex){
               System.out.println(ex.getMessage() == null ? "User does not exist" : "welcome");
           }
       }
    }
}
