<%-- 
    Document   : login
    Created on : 05/04/2024, 1:47:21 PM
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/democss.css">
        <title>Login</title>
    </head>
    <body>
        <% 
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("PassErr");
        %>
        <div class="login-box">
            <h1>Enter your sign-in details: <span> <%=(existErr != null ? existErr : "")%></span></h1>
            <div class="form-container"> <!-- Use this to wrap your form and center its contents -->
                <form action="LoginServlet" method="post">
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
                        <input class="button" type="submit" value="Login">
                        <a class="button" href="index.html">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
