/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */     

package uts.isd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.User;
import uts.isd.model.dao.DBManager;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Validator validator = new Validator();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        DBManager manager = (DBManager) session.getAttribute("manager");

        // Clear previous error messages
        validator.clear(session);

        // Validate user input
        if (!validator.validateEmail(email)) {
            session.setAttribute("emailErr", "Error: Email format is incorrect.");
        } else if (!validator.validateName(name)) {
            session.setAttribute("nameErr", "Error: First name needs to be capitalised and/or need to enter a last name.");
        } else if (!validator.validatePassword(password)) {
            session.setAttribute("passErr", "Error: Password needs to be more than 3 characters long.");
        } else {
            try {
                User exist = manager.findUser(email, password);
                if (exist != null) {
                    session.setAttribute("existErr", "User already exists in the database.");
                } else {
                    // Add user to the database
                    manager.addUser(email, name, password, gender, address);
                    User user = new User(email, name, password, gender, address);
                    session.setAttribute("user", user);

                    // Log user access
                    String loginTime = new Timestamp(System.currentTimeMillis()).toString();
                    session.setAttribute("loginTime", loginTime);
                    session.setAttribute("email", email);
                    session.setAttribute("password", password);

                    // Redirect user to a different page after successful registration
                    response.sendRedirect("index.jsp");
                    return; // Exit method after redirecting
                }
            } catch (SQLException ex) {
                // Log SQL exceptions
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        // If any validation or database error occurs, forward back to registration page
        session.setAttribute("existErr", "Email already exists in database.");
        request.getRequestDispatcher("one.jsp").include(request, response);

    }


}
