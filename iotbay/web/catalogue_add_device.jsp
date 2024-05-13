<%-- 
    Document   : catalogue_add_device
    Created on : 12/05/2024, 2:01:57 PM
    Author     : btjhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/democss.css">
        <title>Adding a Device</title>
    </head>
    <body>
        <% 
            String added = (String) session.getAttribute("added");
            String existErr = (String) session.getAttribute("existErr");
        %>
        <div class="login-box">
            <h1>Adding a Device <span class="message"><%= (existErr != null ? added : "") %></span></h1>
            <form action="AddDeviceServlet" method="POST">
                <div class='form-container'>
                   <table>
                        <tr><td>ID: </td><td><input type="text" class="input-field" name="id" required="true"></td></tr>
                        <tr><td>Product Name: </td><td><input type="text" class="input-field" name="productName" ></td></tr>
                        <tr><td>Description: </td><td><input type="text" class="input-field" name="description" ></td></tr>
                        <tr><td>Price: </td><td><input type="text" class="input-field" name="price" ></td></tr>
                        <tr><td>Supplier: </td><td><input type="text" class="input-field" name="supplier" ></td></tr>
                        <tr><td>Stock: </td><td><input type="text" class="input-field" name="stock" ></td></tr>
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
    </body>
</html>
