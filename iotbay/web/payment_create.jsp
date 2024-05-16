<%-- 
    Document   : payment_create
    Created on : 14/05/2024, 10:24:55 AM
    Author     : yixia
--%>
<%@page import="uts.isd.model.Payment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/democss.css">
        <title>Create Payment</title>
        <style>
            .error-message {
                font-size: 8pt;
                block:inline-text;
            }

        </style>
        <style>
            .nav {
                position: absolute;
                top:20px;
                left:20px;
            }
        </style>
    </head>
    <body>
        <div class="nav">
            <a class="button" style="color:white" href="index.jsp">Back to Main Page</a>
        </div>
        <div class="login-box">
            <h1>Create Payment</h1> 
            <%-- Display error messages --%>
            <% String orderIDFErr = (String) session.getAttribute("orderIDFErr"); %>
            <% String cardHNameFErr = (String) session.getAttribute("cardHNameFErr"); %>
            <% String cardNumberFErr = (String) session.getAttribute("cardNumberFErr"); %>
            <% String expiryFError = (String) session.getAttribute("expiryFError"); %>
            <% String cvvErr = (String) session.getAttribute("cvvErr"); %>
            <% String orderNotExistErr = (String) session.getAttribute("orderNotExistErr"); %>
            <% String createPaymentErr = (String) session.getAttribute("createPaymentErr"); %>
            <% String paymentErr = (String) session.getAttribute("paymentErr"); %>

            <% Payment updatedPayment = (Payment) session.getAttribute("updatedPayment"); %>


            <% if (createPaymentErr != null && !createPaymentErr.equals("")) {%>
            <span class="error-message"><%= createPaymentErr%></span>
            <% }%><br>
            <% if (paymentErr != null && !paymentErr.equals("")) {%>
            <span class="error-message"><%= paymentErr%></span>
            <% }%><br>




            <!--<div class="form-container">--> 
            <form action="PaymentCreateServlet" method="post">
                <label for="orderID">Order ID: </label><br>
                <input type="text" id="orderID" name="orderID" value="<%= (updatedPayment != null) ? updatedPayment.getOrderID() : ""%>"required>
                <% if (orderIDFErr != null && !orderIDFErr.equals("")) {%>
                <br><span class="error-message"><%= orderIDFErr%></span>
                <% }%>
                <% if (orderNotExistErr != null && !orderNotExistErr.equals("")) {%>
                <br> <span class="error-message"><%= orderNotExistErr%></span>
                <% }%><br><br>
                <label for="cardHolderName">Cardholder Name:</label><br>
                <input type="text" id="cardHolderName" name="cardHolderName" value="<%= (updatedPayment != null) ? updatedPayment.getcHName() : ""%>" required>
                <% if (cardHNameFErr != null && !cardHNameFErr.equals("")) {%>
                <br><span class="error-message"><%= cardHNameFErr%></span>
                <% }%><br><br>
                <label for="cardNumber">Card Number:</label><br>
                <input type="text" id="cardNumber" name="cardNumber" value="<%= (updatedPayment != null) ? updatedPayment.getcNumber() : ""%>" required>
                <% if (cardNumberFErr != null && !cardNumberFErr.equals("")) {%>
                <br><span class="error-message"><%= cardNumberFErr%></span>
                <% }%><br><br>
                <label for="cardExpiryMMYY">Expiry Date(MM/YY):</label><br>
                <input type="text" id="cardExpiryMMYY" name="cardExpiryMMYY" value="<%= (updatedPayment != null) ? updatedPayment.getcExMMYY() : ""%>" required>
                <% if (expiryFError != null && !expiryFError.equals("")) {%>
                <br><span class="error-message"><%= expiryFError%></span>
                <% }%><br><br>

                <label for="cardCVC">CVC:</label><br>
                <input type="text" id="cardCVC" name="cardCVC" value="<%= (updatedPayment != null) ? updatedPayment.getcCVC() : ""%>" required>
                <% if (cvvErr != null && !cvvErr.equals("")) {%>
                <br><span class="error-message"><%= cvvErr%></span>
                <% }%><br><br>
                <div class="buttons">
                    <input class="button" type="submit" value="Next">
                    <a class="button" href="index.jsp">Cancel</a>
                </div>
            </form> 
        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
