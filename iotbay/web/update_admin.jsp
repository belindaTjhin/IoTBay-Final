<%-- 
    Document   : update_admin
    Created on : 05/04/2024, 11:36:03 AM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Admin"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Admin Details</title>
    <link rel="stylesheet" href="css/democss.css"> 
</head>
<body>
    <div class="login-box">
        <h1>Update Admin Details</h1>

        <% 
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");

            Admin admin = (Admin) session.getAttribute("admin");

            if (admin != null) {
                admin.setName(name);
                admin.setEmail(email);
                admin.setPassword(password);
                admin.setGender(gender);
                admin.setAddress(address);

        %>
                <p>Admin details updated successfully.</p>
                <p>Your email is: <%= email %>.</p>
                <p>Your password is: <%= password %>.</p>
                <p>Your gender is: <%= gender %>.</p>
                <p>Your address: <%= address %>.</p>
        <% 
            } else {
        %>
                <p>Error: No admin user logged in.</p>
        <% 
            } 
        %>
        <a href="admin_index.jsp">
            <button href="button">Back to Main Page</button>
        </a>
    </div>
</body>
</html>
