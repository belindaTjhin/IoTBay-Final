<%@page import="uts.isd.model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Product"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/democss.css">
    <title>Adding a Device</title>
</head>
<body>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    String added = (String) session.getAttribute("added");
    String existErr = (String) session.getAttribute("existErr");
    Product newProduct = (Product) session.getAttribute("newProduct");
%>
<% if (admin != null) {%>
<div class="login-box">
    <h1>Adding a Device <span class="message"><%= (existErr != null ? existErr : added) %></span></h1>
    <form action="AddDeviceServlet" method="POST">
        <div class='form-container'>
            <table>
                <tr><td>ID: </td><td><input type="text" class="input-field" name="id" value="<%= (newProduct != null ? newProduct.getId() : "") %>" required="true"></td></tr>
                <tr><td>Product Name: </td><td><input type="text" class="input-field" name="productName" value="<%= (newProduct != null ? newProduct.getName() : "") %>"></td></tr>
                <tr><td>Description: </td><td><input type="text" class="input-field" name="description" value="<%= (newProduct != null ? newProduct.getDescription() : "") %>"></td></tr>
                <tr><td>Price: </td><td><input type="text" class="input-field" name="price" value="<%= (newProduct != null ? newProduct.getPrice() : "") %>"></td></tr>
                <tr><td>Supplier: </td><td><input type="text" class="input-field" name="supplier" value="<%= (newProduct != null ? newProduct.getSupplier() : "") %>"></td></tr>
                <tr><td>Stock: </td><td><input type="text" class="input-field" name="stock" value="<%= (newProduct != null ? newProduct.getStock() : "") %>"></td></tr>
            </table>
            <br>
            <span class="message"><%= (added != null ? added : "") %></span>
            <div class="buttons">
                <input class="button" type="submit" value="Add Device">
                <a class="button" href="catalogue_main.jsp">Cancel</a>
            </div>
        </div>
    </form>
</div>
<% } else { %>
<div class="login-box">
    <p>Unauthorized access. Please log in if you are an admin.</p>
    <a class="button" href="admin_login.jsp">Login</a>
</div>
<% }%>
</body>
</html>
