<%-- 
    Document   : catalogue_main
    Created on : 12/05/2024, 8:57:13 PM
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
        <link rel="stylesheet" href="css/democss.css">
        <title>Main Catalogue</title>
    </head>
    <body>
        <%
            ArrayList<Product> catalogue = (ArrayList<Product>) session.getAttribute("catalogue");
            Admin admin = (Admin) session.getAttribute("admin");
        %>
        <div class="login-box">
            <h1>Select the following: </h1>
            <div class="button-group">
                <a href="CatalogueViewServlet">
                    <button class="button">View Catalogue</button>
                </a>
                <a href="catalogue_add_device.jsp">
                    <button class="button">Add Device</button>
                </a>
                <%if(admin != null) {%>
                <a href="catalogue_delete_device.jsp">
                    <button class="button">Delete Device</button>
                </a>
                <%} %>
                <a href="index.html">
                    <button class="button">Back</button>
                </a>
            </div>
        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
