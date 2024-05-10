package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.dao.DBManager;
import uts.isd.model.User;


public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        DBManager manager = (DBManager) session.getAttribute("manager");
        String email = (String) session.getAttribute("email");
        String password = (String) session.getAttribute("password");
        String loginTime = (String) session.getAttribute("loginTime");
        String logoutTime = new Timestamp(System.currentTimeMillis()).toString();

        try {
            // if user exists, add access log
            User exist = manager.findUser(email,password);
            if(exist!=null){
                manager.addUserLog(email, loginTime, logoutTime);
            }
            // else -- add admin log
            else{
                manager.addAdminLog(email, loginTime, logoutTime);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(LogoutServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        session.invalidate();
        response.sendRedirect("logout.jsp");

    }
}
