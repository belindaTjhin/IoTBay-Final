<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Form</title>
</head>
<body>
    <h1>Order Form</h1>
    <form id="orderForm">
        <h3>Order 1</h3>
        <div>
            <label for="productId">Product ID:</label>
            <input type="text" id="productId" name="productId" required>
        </div>
        <div>
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" min="1" required>
        </div>
         <h3>Order 2</h3>
        <div>
            <label for="productId">Product ID:</label>
            <input type="text" id="productId" name="productId" required>
        </div>
        <div>
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" min="1" required>
        </div>
          <h3>Order 3</h3>
        <div>
            <label for="productId">Product ID:</label>
            <input type="text" id="productId" name="productId" required>
        </div>
        <div>
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" min="1" required>
        </div>
           <h3>Order 4</h3>
        <div>
            <label for="productId">Product ID:</label>
            <input type="text" id="productId" name="productId" required>
        </div>
        <div>
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" min="1" required>
        </div>
        <button type="button" onclick="saveOrder()">Save</button>
    </form>

    <script>
        function saveOrder() {
            var productId = document.getElementById("productId").value;
            var quantity = parseInt(document.getElementById("quantity").value);

            // Example: sending data to server
            var orderData = {
                productId: productId,  
                quantity: quantity
            };
            // Here you can add AJAX request to send data to server
            // For example using fetch API or XMLHttpRequest
            // fetch('url-to-submit', {
            //     method: 'POST',
            //     body: JSON.stringify(orderData),
            //     headers: {
            //         'Content-Type': 'application/json'
            //     }
            // }).then(response => {
            //     if (!response.ok) {
            //         throw new Error('Network response was not ok');
            //     }
            //     return response.json();
            // }).then(data => {
            //     console.log(data);
            // }).catch(error => {
            //     console.error('There has been a problem with your fetch operation:', error);
            // });

            // For this example
