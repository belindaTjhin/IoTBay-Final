<%-- 
    Document   : catalogue
    Created on : 09/05/2024, 10:10:22 PM
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
        <title>IoT Device Catalogue</title>
        <link rel="stylesheet" href="css/democss.css">
        <style>
            table, td, th {
                border: 1px solid;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
        </style>
    </head>
    <body action="CatalogueViewServlet">
        <% 
            ArrayList<Product> catalogue = (ArrayList<Product>) session.getAttribute("catalogue");
            String show = (String) session.getAttribute("show");
            Admin admin = (Admin) session.getAttribute("admin");
        %>
        <div class="centered-content">
            <div class='login-box'>
                <h1>IoT Device Catalogue</h1>
                <a href="catalogue_search.jsp">
                    <button class="button">Search for Device</button>
                </a>
                <br>
                <table>
                    <tr>
                        <th>
                            <b>Product ID</b>
                        </th>
                        <th>
                            <b>Product Name</b>
                        </th>
                        <th>
                            <b>Description</b>
                        </th>
                        <th>
                            <b>Price</b>
                        </th>
                        <th>
                            <b>Supplier</b>
                        </th>
                        <th>
                            <b>Stock</b>
                        </th>
                    </tr>
                    <% 
                        if(catalogue != null){
                            for (Product p : catalogue){
                    %>
                                <tr>
                                    <td><p><%=p.getId()%></p></td>
                                    <td><p><%=p.getName()%></p></td>
                                    <td><p><%=p.getDescription()%></p></td>
                                    <td><p>$<%=p.getPrice()%></p></td>
                                    <td><p><%=p.getSupplier()%></p></td>
                                    <td><p><%=p.getStock()%></p></td>
                                </tr>
                            <%}%>
                </table>
                <br>
                <a href="catalogue_main.jsp">
                    <button class="button">Back</button>
                </a>
                <%} else { %>
                    <span><%=(show != null ? show : "")%></span>
                <%}%>
            </div>
        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
