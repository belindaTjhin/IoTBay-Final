<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Order Form</title>
    <style>
        body {
            background-color: #f0f0f0;
            text-align: center; 
        }
        #orderForm {
            width: 300px;
            margin: 50px auto; 
            background-color: #ffffff; 
            padding: 20px; 
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
        }
        #orderForm h3 {
            margin-top: 20px;
        }
        #orderForm div {
            margin-bottom: 10px; 
        }
        label {
            display: inline-block; 
            width: 100px; 
            text-align: left; 
        }
        input[type="text"],
        input[type="number"] {
            width: calc(100% - 110px); 
            padding: 5px; 
        }
        button {
            background-color: #4caf50;
            color: white; 
            padding: 10px 20px; 
            border: none; 
            border-radius: 5px; 
            cursor: pointer; 
        }
        button:hover {
            background-color: #45a049; 
        }
        .button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #4caf50;
    color: white;
    text-decoration: none; 
    border-radius: 5px;
    transition: background-color 0.3s ease; 
}
.button:hover {
    background-color: #45a049;
}
    </style>
</head>
<body>
    <h1>Order Form</h1>
    <form id="orderForm">
        <h3>Order 1</h3>
        <div>
            <label for="productId1">Product ID:</label>
            <input type="text" id="productId1" name="productId" required>
        </div>
        <div>
            <label for="quantity1">Quantity:</label>
            <input type="number" id="quantity1" name="quantity" min="1" required>
        </div>
        <h3>Order 2</h3>
        <div>
            <label for="productId2">Product ID:</label>
            <input type="text" id="productId2" name="productId" required>
        </div>
        <div>
            <label for="quantity2">Quantity:</label>
            <input type="number" id="quantity2" name="quantity" min="1" required>
        </div>
       <h3>Order 3</h3>
        <div>
            <label for="productId2">Product ID:</label>
            <input type="text" id="productId2" name="productId" required>
        </div>
        <div>
            <label for="quantity2">Quantity:</label>
            <input type="number" id="quantity2" name="quantity" min="1" required>
       </div>   
       <a class="button" href="vieworder.jsp">Submit Order</a>
</<body>
 