<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.Orderline"%>
<%@page import="uts.isd.model.Orders"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search OrderLine</title>
        <link rel="stylesheet" href="css/democss.css">
    </head>
    <body>
        <div class="form-container">
            <div class='login-box'>
                <h1>Search:</h1>
                <form action="OrderLineSearchServlet" method='post'>
                    <input type='text' name="orderlineID" required>
                    <input type="submit" value="Search OrderLine ID">
                </form> 
                <br>
                <span class="message"><%=(request.getAttribute("found") != null ? request.getAttribute("found") : "")%></span>
               
                <% Orderline orderline = (Orderline) request.getAttribute("orderline");
                   if(orderline != null) { %>
                    <table>
                        <tr><td><b>OrderLine ID: </b></td><td><p><%=orderline.getOrderlineID()%></p></td></tr>
                        <tr><td><b>Order ID: </b></td><td><p><%=orderline.getOrderID()%></p></td></tr>
                        <tr><td><b>Quantity: </b></td><td><p><%=orderline.getQuantity()%></p></td></tr>
                        <tr><td><b>Product ID: </b></td><td><p><%=orderline.getProductID()%></p></td></tr>
                        <tr><td><b>Product Name: </b></td><td><p><%=orderline.getProductName()%></p></td></tr>
                        <tr><td><b>Total Price: </b></td><td><p><%=orderline.getTotalPrice()%></p></td></tr>
                        <tr><td><b>Unit Price: </b></td><td><p><%=orderline.getPrice()%></p></td></tr>
                    </table>
                    <% Orders order = (Orders) request.getAttribute("order");
                       if (order != null) { %>
                        <a href="OrderForm.jsp">
                            <button class="button">Make OrderForm</button>
                        </a>
                    <% } %>
                <% } %>
                <a class="button" href="one.jsp">Cancel</a>
            </div>
            <br>
        </div>
    </body>
</html>
