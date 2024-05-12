<%-- 
    Document   : catalogue_search_result
    Created on : 12/05/2024, 11:33:36 AM
    Author     : btjhi
--%>

<%@page import="uts.isd.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Device Search Result</title>
        <link rel="stylesheet" href="css/democss.css">
    </head>
    <body>
        <% 
            Product product = (Product) session.getAttribute("product");
            String found = (String) session.getAttribute("found");
        %>
        <div class="login-box">
            <h1>Search Results</h1>
            <% if(product != null) {%>
            <table>
                <tr>
                    <td>
                        <b>Product ID: </b>
                    </td>
                    <td>
                        <p><%=product.getId()%></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Product Name: </b>
                    </td>
                    <td>
                        <p><%=product.getName()%></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Description: </b>
                    </td>
                    <td>
                        <p><%=product.getDescription()%></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Price: </b>
                    </td>
                    <td>
                        <p><%=product.getPrice()%></p>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Supplier: </b>
                    </td>
                    <td>
                        <p><%=product.getSupplier()%></p>
                    </td>
                </tr>
            </table>
                    
            <%} else {%>
            <div class="login-box">
                <span><%=(found != null ? found : "")%></span>
            </div>
            <% } %>
        </div>
    </body>
</html>
