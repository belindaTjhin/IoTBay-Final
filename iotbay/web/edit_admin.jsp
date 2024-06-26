<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.Admin" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/democss.css"> 
    <title>Edit Staff Account</title>
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
            Admin admin = (Admin) session.getAttribute("admin");
            String updated = (String)session.getAttribute("updated");
            if (admin != null) { 
        %>
        
        <h1>Edit Account<span class = "message"> <%=(updated !=null ? updated : "")%></span></h1>
            <%-- Display error messages --%>
            <% String emailErr = (String) session.getAttribute("emailErr"); %>
            <% String nameErr = (String) session.getAttribute("nameErr"); %>
            <% String passErr = (String) session.getAttribute("passErr"); %>
            <% String existErr = (String) session.getAttribute("existErr"); %>

            <% if (existErr != null && emailErr.equals("Enter email") && nameErr.equals("Enter name") && passErr.equals("Enter password")){ %>
                <p class="error-message"><%= existErr %></p>
            <% } %>
            <% if (emailErr != null && !emailErr.equals("Enter email")) { %>
                <p class="error-message"><%= emailErr %></p>
            <% } %>

            <% if (nameErr != null && !nameErr.equals("Enter name")) { %>
                <p class="error-message"><%= nameErr %></p>
            <% } %>

            <% if (passErr != null && !passErr.equals("Enter password")) { %>
                <p class="error-message"><%= passErr %></p>
            <% } %>

            <form action="UpdateAdminServlet" method="post">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="${admin.name}" required>
                </div>
                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <input type="text" id="gender" name="gender" value="${admin.gender}">
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="${admin.address}">
                </div>
                <!-- New inputs for old and new email -->
                <div class="form-group">
                    <label for="email">Current Email:</label>
                    <input type="email" id="email" name="email" value="${admin.email}" required>
                </div>
                <div class ="form-group">
                    <label for="email">New Email:</label>
                    <input type="hidden" id="oldEmail" name="oldEmail" value="${admin.email}" required>
                    <input type="email" id="newEmail" name="newEmail" value="${admin.email}" required>
                </div>
                
                <!-- New inputs for old and new password -->
                <div class="form-group">
                    <label for="password">Current Password:</label>
                    <input type="password" id="password" name="password" value="${admin.password}" required>
                </div><!-- comment -->
                <div class ="form-group">
                    <label for="password">New Password:</label>
                    <input type="hidden" id="oldPassword" name="oldPassword" value="${admin.password}" required>
                    <input type="password" id="newPassword" name="newPassword" value="${admin.password}" required>
                </div>
                
                <input type="submit" class="button" value="Update">
            </form>
            <a href="delete_admin.jsp" class="button-link">
                <button class="button">Delete Account</button>
            </a>
        <% } else { %>
            <p>No staff account logged in.</p>
        <% } %>
        


        <div class ="panel_div">
            <a class="button" href="admin_index.jsp">Main Page</a>
        </div>
    </div>
    <jsp:include page="/ConnServlet" flush="true"/> 
</body>
</html>
