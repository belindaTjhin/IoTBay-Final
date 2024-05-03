<%-- 
    Document   : edit_user
    Created on : 05/04/2024, 11:32:28 AM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.User"%>
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
        <h1>Edit Account</h1>
        
        <% 
            User user = (User) session.getAttribute("user"); 
            if (user != null) { 
        %>
            <form action="update_user.jsp" method="post">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%= user.getName() %>" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" value="<%= user.getPassword() %>" required>
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <input type="text" id="gender" name="gender" value="<%= user.getGender() %>">
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="<%= user.getAddress() %>">
                </div>
                <input type="submit" class="button" value="Update">
            </form>
        <% } else { %>
            <p>No user logged in.</p>
        <% } %>
        
        <a href="index.jsp" class="button-link">
            <button class="button">Back to Main Page</button>
        </a>
    </div>
</body>
</html>
