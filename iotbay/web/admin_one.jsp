<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.Admin" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Registration</title>
    <link rel="stylesheet" type="text/css" href="css/democss.css">
</head>
<body>
    <form action="RegisterAdminServlet" method="post">
        <div class="login-box">
            <h1>Staff Registration</h1>
            <table>
                <tr>
                    <td>Full Name:</td>
                    <td><input type="text" class="input-field" name="name" placeholder="Enter Name" value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>" required></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" class="input-field" name="email" placeholder="Enter Email" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" class="input-field" name="password" placeholder="Enter Password" required></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><input type="text" class="input-field" name="gender" placeholder="Enter Gender" value="<%= request.getParameter("gender") != null ? request.getParameter("gender") : "" %>"></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" class="input-field" name="address" placeholder="Enter Address" value="<%= request.getParameter("address") != null ? request.getParameter("address") : "" %>"></td>
                </tr>
                <tr>
                    <td>Agree to TOS:</td>
                    <td><input type="checkbox" name="tos" required> I agree to the terms of service</td>
                </tr>
            </table>
            <input type="hidden" name="submitted" value="yes">
            <div class="buttons">
                <input type="submit" class="button" value="Register">
                <a href="index.html" class="button">Cancel</a>
            </div>
           <%-- Display error messages --%>
            <% String existErr = (String) session.getAttribute("existErr"); %>
            <% if (existErr != null) { %>
                <p class="error-message"><%= existErr %></p>
            <% } else { %>
                <% String emailErr = (String) session.getAttribute("emailErr"); %>
                <% if (emailErr != null) { %>
                    <p class="error-message"><%= emailErr %></p>
                <% } %>
                <% String passErr = (String) session.getAttribute("passErr"); %>
                <% if (passErr != null) { %>
                    <p class="error-message"><%= passErr %></p>
                <% } %>
                <% String nameErr = (String) session.getAttribute("nameErr"); %>
                <% if (nameErr != null) { %>
                    <p class="error-message"><%= nameErr %></p>
                <% } %>
                <% String addressErr = (String) session.getAttribute("addressErr"); %>
                <% if (addressErr != null) { %>
                    <p class="error-message"><%= addressErr %></p>
                <% } %>
                <% String genderErr = (String) session.getAttribute("genderErr"); %>
                <% if (genderErr != null) { %>
                    <p class="error-message"><%= genderErr %></p>
                <% } %>
            <% } %>
        </div>
    </form>
    
    <jsp:include page="/ConnServlet" flush="true"/> 
</body>
</html>
