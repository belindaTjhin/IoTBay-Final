<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.Orders"%>
<%@page import="uts.isd.model.Orderline"%>
<%@page import="uts.isd.model.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/democss.css">
    <title>Order Form</title>
</head>
<body>
    <div class="login-box">
    <h1>Order Form</h1>
    <form action="SubmitOrderServlet" method="post">
        <label for="userEmail">User Email:</label><br>
        <input type="text" id="userEmail" name="userEmail"><br>
        <label for="orderDate">Order Date:</label><br>
        <input type="text" id="orderDate" name="orderDate"><br>
        <label for="shippingAddress">Shipping Address:</label><br>
        <input type="text" id="shippingAddress" name="shippingAddress"><br>
        
        <a href="SubmitOrder">
            <button class="button"> Submit Order</button>
        </a>
        <a href="OrderLineView">
            <button class="button"> Check OrderLine</button>
        </a>
        </div>
    </form>
</body>
</html>
