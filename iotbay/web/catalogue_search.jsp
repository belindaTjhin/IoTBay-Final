<%-- 
    Document   : catalogue_search
    Created on : 10/05/2024, 4:59:40 PM
    Author     : btjhi
--%>

<%@page import="uts.isd.model.Admin"%>
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
        Product product = (Product) session.getAttribute("product");
        String found = (String) session.getAttribute("found");
        Admin admin = (Admin) session.getAttribute("admin");
    %>
    <body>
        <div class="form-container">
            <div class='login-box'>
                <h1>Search:</h1>
                <form action="CatalogueSearchServlet" method='post'>
                    <input type='text'name="deviceName">
                    <input type="submit" value="Search Item">
                </form>
                <br>
                <span class="message"><%=(found != null ? found : "")%></span>
                
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
                    
            <%} %> 
            </div>
        </div> 
    </body>
</html>
