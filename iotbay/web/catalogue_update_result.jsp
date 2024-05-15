<%-- 
    Document   : catalogue_update_result
    Created on : 14/05/2024, 9:35:58 PM
    Author     : btjhi
--%>

<%@page import="uts.isd.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/democss.css"> 
        <title>Updated Device Details</title>
    </head>
    <body>
        <div class="login-box">
            <h1>Updated Device Details</h1>
            
            <% 
                Product product = (Product) session.getAttribute("product");
                String updated = (String) session.getAttribute("updated");
            %>
            <p><%= session.getAttribute("updated") %></p>
            <p>Product id is: <%= product.getId() %>.</p>
            <p>Product name is: <%= product.getName() %>.</p>
            <p>Product description is: <%= product.getDescription() %>.</p>
            <p>Product price is: <%= product.getPrice() %>.</p>
            <p>Product supplier is: <%= product.getSupplier() %>.</p>
            <p>Product stock is: <%= product.getStock() %>.</p>
            
            <br>
            <div class="button-group">
                <a href="catalogue_main.jsp" class="button-link">
                    <button class="button">Catalogue Functions</button>
                </a>
                <a href="catalogue_update_device.jsp" class="button-link">
                    <button class="button">Edit Device</button>
                </a>
            </div>
        </div>
    </body>
</html>
