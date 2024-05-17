<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, uts.isd.model.*, uts.isd.model.dao.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Line View</title>
</head>
<body>
    <h2>Order Line Details</h2>
    <%
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        DBConnector dbConnector = new DBConnector();
        Connection conn = dbConnector.getConnection();
        OrderLineDBManager orderLineDBManager = new OrderLineDBManager(conn);

        List<Orderline> orderLines = orderLineDBManager.fetchOrderLines(orderID);
        if (orderLines != null && !orderLines.isEmpty()) {
    %>
        <h3>Order ID: <%= orderID %></h3>
        <%
            for (Orderline orderline : orderLines) {
        %>
            <div>
                Product ID: <%= orderline.getProductID() %><br>
                Quantity: <%= orderline.getQuantity() %><br>
                Product Name: <%= orderline.getProductName() %><br>
                Total Price: <%= orderline.getTotalPrice() %><br>
                Price per Unit: <%= orderline.getPrice() %><br>
                <hr>
            </div>
        <%
            }
        %>
    <%
        } else {
    %>
        <p>No order lines found for this order.</p>
    <%
        }
    %>
</body>
</html>
