<%-- 
    Document   : catalogue_update_device
    Created on : 14/05/2024, 11:48:11 AM
    Author     : btjhi
--%>

<%@page import="uts.isd.model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/democss.css">
        <title>Delete Device</title>
    </head>
    <body>
        <% 
            Admin admin = (Admin) session.getAttribute("admin");
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("PassErr");
        %>
        <div class="login-box">
            <h1>Please enter your login details: <span> <%=(existErr != null ? existErr : "")%></span></h1>
            <div class="form-container">
                <form>
                    <table>
                        <tr>
                            <td>Email:</td>
                            <td><input type="text" placeholder="<%=(emailErr != null ? emailErr: "Enter email")%>" name="email" required></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" placeholder="<%=(passErr != null ? passErr : "Enter password")%>" name="password" required></td>
                        </tr>
                    </table>
                    <div class="buttons">
                        <input class="button" type="submit" value="Delete Device">
                        <a class="button" href="catalogue_search.jsp">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
