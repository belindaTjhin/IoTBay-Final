<%-- 
    Document   : catalogue_update_device
    Created on : 14/05/2024, 11:48:11 AM
    Author     : btjhi
--%>

<%@page import="uts.isd.model.Product"%>
<%@page import="uts.isd.model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/democss.css">
        <title>Update Device</title>
    </head>
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
    <body>
        <% 
            String updated = (String) session.getAttribute("updated");
            Product product = (Product) session.getAttribute("product");
            if(product != null) {
        %>
        <div class="login-box">
            <h1>Edit Device details: <span class="message"> <%=(updated != null ? updated : "")%></span></h1>
            <form action="UpdateDeviceServlet" method="post">
                <div class="form-group">
                    <label for="id">ID:</label>
                    <input type="text" class="input-field" id="id" name="id" value="${product.id}" required>
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <input type="text" class="input-field" id="description" name="description" value="${product.description}">
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="text" class="input-field" id="price" name="price" value="${product.price}">
                </div>
                <div class="form-group">
                    <label for="supplier">Supplier:</label>
                    <input type="text" class="input-field" id="supplier" name="supplier" value="${product.supplier}">
                </div>
                <div class="form-group">
                    <label for="stock">Stock:</label>
                    <input type="text" class="input-field" id="stock" name="stock" value="${product.stock}">
                </div>
                <!-- New inputs for old and new email -->
                <div class="form-group">
                    <label for="name">Current Name:</label>
                    <input type="text" class="input-field" id="name" name="name" value="${product.name}" required>
                </div>
                <div class ="form-group">
                    <label for="name">New Name:</label>
                    <input type="hidden" id="oldName" name="oldName" value="${product.name}" required>
                    <input type="text" class="input-field" id="newName" name="newName" value="${product.name}" required>
                </div>
                
                <input type="submit" class="button" value="Update">
            </form>
            <% } else { %>
                <p>No product select.</p>
            <% } %>
            <br>
            <div class ="panel_div">
                <a class="button" href="catalogue.jsp">Back to Catalogue</a>
            </div>   
        </div>
    </body>
</html>
