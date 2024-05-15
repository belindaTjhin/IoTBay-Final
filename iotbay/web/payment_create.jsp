<%-- 
    Document   : payment_create
    Created on : 14/05/2024, 10:24:55 AM
    Author     : yixia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/democss.css">
        <title>Create Payment</title>
    </head>
    <body>
        <div class="login-box">
            <h1>Create Payment</h1> 
            <!--<div class="form-container">--> 
                <form action="paymentCreateServlet">
                    <label for="orderID">Order ID: </label><br>
                    <input type="text" id="orderID" name="orderID" required><br><br>
                    <label for="cardHolderName">Cardholder Name:</label><br>
                    <input type="text" id="cardHolderName" name="cardHolderName" required><br><br>
                    <label for="cardNumber">Card Number:</label><br>
                    <input type="text" id="cardNumber" name="cardNumber" required><br><br>
                    <label for="cardExpiryMM">Expiry Date(MMYY):</label><br>
                    <input type="text" id="cardExpiryMM" name="cardExpiryMM" required><br><br>

                    <label for="cardCVC">CVC:</label><br>
                    <input type="text" id="cardCVC" name="cardCVC" required><br><br>
                    <div class="buttons">
                        <input class="button" type="submit" value="Next">
                        <a class="button" href="index.html">Cancel</a>
                    </div>
                </form> 
            <!--</div>-->
        </div>
    </body>
</html>
