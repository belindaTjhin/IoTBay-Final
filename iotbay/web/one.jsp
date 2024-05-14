<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="uts.isd.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <link rel="stylesheet" type="text/css" href="css/democss.css">
</head>
<body>
    <div class="login-box">
        <h1>User Registration</h1>
        <%-- Display error messages --%>
        <% String emailErr = (String) session.getAttribute("emailErr"); %>
        <% String nameErr = (String) session.getAttribute("nameErr"); %>
        <% String passErr = (String) session.getAttribute("passErr"); %>
        <% String existErr = (String) session.getAttribute("existErr"); %>

        <!-- Debugging output -->
        <p>existErr: <%= existErr %></p>
        <p>emailErr: <%= emailErr %></p>
        <p>nameErr: <%= nameErr %></p>
        <p>passErr: <%= passErr %></p>
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



        <form action="RegisterServlet" method="post">
            <table>
                <tr>
                    <td>Full Name:</td>
                    <td><input type="text" class="input-field" name="name" value="<%= (nameErr == null && existErr == null) ? (request.getParameter("name") != null ? request.getParameter("name") : "") : "" %>" required></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" class="input-field" name="email" value="<%= (emailErr == null && existErr == null) ? (request.getParameter("email") != null ? request.getParameter("email") : "") : "" %>" required></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" class="input-field" name="password" required></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><input type="text" class="input-field" name="gender" value="<%= request.getParameter("gender") != null ? request.getParameter("gender") : "" %>"></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" class="input-field" name="address" value="<%= request.getParameter("address") != null ? request.getParameter("address") : "" %>"></td>
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
        </form>
    </div>
    <jsp:include page="/ConnServlet" flush="true"/> 
</body>
</html>
