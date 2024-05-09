<%-- 
    Document   : edit_admin
    Created on : 05/04/2024, 11:32:28 AM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Admin"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/democss.css"> 
    <title>Edit Account</title>
    <style>
        .form-group {
            margin-bottom: 15px; /* Adds space below each form group */
        }
        label, input, .button {
            display: block; /* Makes each element take its own line */
            margin-bottom: 5px; /* Adds space below each element */
        }
        input, .button {
            width: 100%; /* Makes input fields and button take full width of their container */
            box-sizing: border-box; /* Ensures padding doesn't add to the width */
        }
    </style>
</head>
<body>
    <div class="login-box">
        
        <% 
            Admin admin = (Admin) session.getAttribute("admin");
            String updated = (String)session.getAttribute("updated");
            if (admin != null) { 
        %>
        
        <h1>Edit Account<span class = "message"> <%=(updated !=null ? updated : "")%></span></h1>
            <form action="UpdateAdminServlet" method="post">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="${admin.name}" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${admin.email}" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" value="${admin.password}" required>
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <input type="text" id="gender" name="gender" value="${admin.gender}">
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="${admin.address}">
                </div>
                <input type="submit" class="button" value="Update">
            </form>
        <% } else { %>
            <p>No admin logged in.</p>
        <% } %>
        
        <div class ="panel_div">
            <a class="button" href="MainServlet?email=<%= admin.getEmail() %>&password=<%= admin.getPassword() %>">Main Page</a>
        </div> 
        <%--<a href="index.jsp" class="button-link">
            <button class="button">Back to Main Page</button>
        </a>--%>
    </div>
</body>
</html>
