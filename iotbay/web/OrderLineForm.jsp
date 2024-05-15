<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Line Form</title>
</head>
<body>
    <h2>Order Line Form</h2>
    <form action="SubmitOrderLineServlet" method="post">
        <input type="hidden" name="orderID" value="<%= request.getParameter("orderID") %>">
        <label>Product ID: <input type="text" name="productID" required></label><br>
        <label>Quantity: <input type="text" name="quantity" required></label><br>
        <button type="submit">Submit Order Line</button>
    </form>
</body>
</html>
