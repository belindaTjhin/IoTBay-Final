<%-- 
    Document   : catalogue_search
    Created on : 10/05/2024, 4:59:40 PM
    Author     : btjhi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Catalogue</title>
        <link rel="stylesheet" href="css/democss.css">
    </head>
    <% 
        ArrayList<Product> catalogue = (ArrayList<Product>) session.getAttribute("catalogue");
        Product product = (Product) session.getAttribute("product");
        String found = (String) session.getAttribute("found");
    %>
    <body>
        <div class="form-container">
            <div class='login-box'>
                <h1>Search:</h1>
                <form action="CatalogueSearchServlet" method='get' autocomplete="off">
                    <input type='text'name="deviceName">
                    <input type="submit" value="Search Item">
                </form>
                <br>
                <span><%=(found != null ? found : "")%></span>
            </div>
        </div>
    </body>
</html>
