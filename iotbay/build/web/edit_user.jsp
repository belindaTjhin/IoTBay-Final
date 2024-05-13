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
            margin-bottom: 15px; 
        }
        label, input, .button {
            display: block; 
            margin-bottom: 5px; 
        }
        input, .button {
            width: 100%; 
            box-sizing: border-box; 
        }
    </style>
</head>
<body>
    <div class="login-box">
        
        <% 
            User user = (User) session.getAttribute("user");
            String updated = (String)session.getAttribute("updated");
            if (user != null) { 
        %>
        
        <h1>Edit Account<span class = "message"> <%=(updated !=null ? updated : "")%></span></h1>
            <form action="UpdateServlet" method="post">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="${user.name}" required>
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <input type="text" id="gender" name="gender" value="${user.gender}">
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="${user.address}">
                </div>
                <!-- New inputs for old and new email -->
                <div class="form-group">
                    <label for="email">Current Email:</label>
                    <input type="email" id="email" name="email" value="${user.email}" required>
                </div>
                <div class ="form-group">
                    <label for="email">New Email:</label>
                    <input type="hidden" id="oldEmail" name="oldEmail" value="${user.email}">
                    <input type="email" id="newEmail" name="newEmail" placeholder="Enter New Email">
                </div>
                
                <!-- New inputs for old and new password -->
                <div class="form-group">
                    <label for="password">Current Password:</label>
                    <input type="password" id="password" name="password" value="${user.password}" required>
                </div><!-- comment -->
                <div class ="form-group">
                    <label for="password">New Password:</label>
                    <input type="hidden" id="oldPassword" name="oldPassword" value="${user.password}">
                    <input type="password" id="newPassword" name="newPassword" placeholder="Enter New Password">
                </div>
                
                <input type="submit" class="button" value="Update">
            </form>
        <% } else { %>
            <p>No user logged in.</p>
        <% } %>
        
        <div class ="panel_div">
        <a class="button" href="index.jsp">Main Page</a>
        </div> 
        <!--<a href="index.jsp" class="button-link">
            <button class="button">Back to Main Page</button>
        </a>-->
    </div>
</body>
</html>
