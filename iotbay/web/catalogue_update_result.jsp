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
                String id = request.getParameter("id");
                String name = request.getParameter("newName");
                String description = request.getParameter("description");
                String price = request.getParameter("price");
                String supplier = request.getParameter("supplier");
                String stock = request.getParameter("stock");
                Product product = (Product) session.getAttribute("admin");
            %>
            <p>Product details updated successfully.</p>
            <p>Product id is: <%= id %>.</p>
            <p>Product name is: <%= name %>.</p>
            <p>Product description is: <%= description %>.</p>
            <p>Product price is: <%= price %>.</p>
            <p>Product supplier is: <%= supplier %>.</p>
            <p>Product stock is: <%= stock %>.</p>
            
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
