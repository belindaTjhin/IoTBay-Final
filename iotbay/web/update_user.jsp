<%-- 
    Document   : update_user
    Created on : 05/04/2024, 11:36:03 AM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update User Details</title>
    <link rel="stylesheet" href="css/democss.css"> 
</head>
<body>
    <div class="login-box">
        <h1>Update User Details</h1>

        <% 
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");

            User user = (User) session.getAttribute("user");

            if (user != null) {
                user.setName(name);
                user.setEmail(email);
                user.setPassword(password);
                user.setGender(gender);
                user.setAddress(address);

        %>
                <p>User details updated successfully.</p>
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
        <a href="index.jsp">
            <button href="button">Back to Main Page</button>
        </a>
    </div>
</body>
</html>
