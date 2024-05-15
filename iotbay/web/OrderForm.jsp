<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Form</title>
</head>
<body>
    <h2>Order Form</h2>
    <form action="SubmitOrderServlet" method="post">
        <label>User Email: <input type="email" name="userEmail" required></label><br>
        <label>Order Date: <input type="date" name="orderDate" required></label><br>
        <label>Shipping Address: <input type="text" name="shippingAddress" required></label><br>
        <button type="submit">Submit Order</button>
    </form>
</body>
</html>
