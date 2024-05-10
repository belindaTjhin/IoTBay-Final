<%-- 
    Document   : index
    Created on : 05/04/2024, 10:33:48 AM
--%>

<%@page import="uts.isd.model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        <link rel="stylesheet" href="css/democss.css">
    </head>
       <% Admin admin = (Admin) session.getAttribute("admin"); %>
        <% if (admin != null) {%>
        <div class="login-box"> <!-- Apply the light blue box styling when admin is logged in -->
            <h1>Welcome, <%= admin.getName()%>!</h1>
            <div class="admin-info">
                <p>Your email is <%= admin.getEmail()%></p>
                <div class="buttons">                    
                    <a href="${pageContext.request.contextPath}/LogoutServlet" class="button">Logout</a>
                    <a class="button" href="EditAdminServlet?email='<%=admin.getEmail()%>'&password='<%=admin.getPassword()%>'">My Account</a>
                </div>  
            </div>
        </div>
        <% } else { %>
        <div class="login-box"> <!-- You can also apply the styling for consistency even if not logged in -->
            <p>Please log in to view your details.</p>
            <a class="button" href="admin_login.jsp">Login</a>
        </div>
        <% }%>

</html>
