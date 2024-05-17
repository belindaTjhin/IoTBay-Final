<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/democss.css">
    <title>Order Line Form</title>
</head>
<body>
    <div class="login-box">
    <h1>Order Line Form</h1>
    <form action="SubmitOrderLineServlet" method="post">
        <label for="Product ID">Product ID:</label><br>
        <input type="text" id="productid" name="productid"><br>
        <label for="Productname">Product Name:</label><br>
        <input type="text" id="Productname" name="Productname"><br>
        <label for="quantity">Quantity:</label><br>
        <input type="text" id="quantity" name="quantity"><br>
        
        <a href="SubmitOrderLine">
        <button class="button">Submit Order Line</button>
        </a>
    </form>
    </div>
</body>
</html>
