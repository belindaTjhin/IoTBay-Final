<%-- 
    Document   : update_user
    Created on : 05/04/2024, 11:36:03 AM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Admin"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Staff Details</title>
    <link rel="stylesheet" href="css/democss.css"> 
</head>
<body>
    <div class="login-box">
        <h1>Updated Staff Details</h1>

        <% 
            String name = request.getParameter("name");
            String email = request.getParameter("newEmail");
            String password = request.getParameter("newPassword");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            Admin admin = (Admin) session.getAttribute("admin");

            if (admin != null) {

        %>
                <p>User details updated successfully.</p>
                <p>Your name is: <%= name %>.</p>
                <p>Your email is: <%= email %>.</p>
                <p>Your password is: <%= password %>.</p>
                <p>Your gender is: <%= gender %>.</p>
                <p>Your address: <%= address %>.</p>
        <% 
            } else {
        %>
                <p>Error: No user logged in.</p>
        <% 
            } 
            %>
    <div class="button-group">
        <a href="admin_index.jsp" class="button-link">
            <button class="button">Main Page</button>
        </a>
        <a href="edit_admin.jsp" class="button-link">
            <button class="button">Edit Account</button>
        </a>
    </div>
    </div>
</body>
</html>
