<%-- 
    Document   : index
    Created on : 05/04/2024, 10:33:48 AM
--%>

<%@page import="uts.isd.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        <link rel="stylesheet" href="css/democss.css">
    </head>
    <body>
        <% User user = (User) session.getAttribute("user"); %>
        <% if (user != null) {%>
        <div class="login-box"> <!-- Apply the light blue box styling when user is logged in -->
            <h1>Welcome, <%= user.getName()%>!</h1>
            <div class="user-info">
                <p>Your email is <%= user.getEmail()%></p>
                <div class="buttons">
                    <a href="logout.jsp" class="button">Logout</a>
                    <a href="edit_user.jsp" class="button">My Account</a>
                </div>  
            </div>
        </div>
        <% } else { %>
        <div class="login-box"> <!-- You can also apply the styling for consistency even if not logged in -->
            <p>Please log in to view your details.</p>
            <a class="button" href="login.jsp">Login</a>
        </div>
        <% }%>
    </body>
</html>
