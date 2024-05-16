<%-- 
    Document   : payment_view
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
            .text-align-left {
                text-align: left;
            }
        </style>
    </head>
    <body>
        <%
            Payment p = (Payment) session.getAttribute("updatedPayment");
        %>
        <form action="PaymentConfirmServlet" method="post">
            <div class="login-box text-align-left">
                <h1>Confirm Payment</h1> 
                <p>Your order ID is:</p>
                <p><%=p.getOrderID()%></p>
                <p>Your CardHolder Name is:</p>
                <p><%=p.getcHName()%></p>
                <p>Your Card Number is:</p>
                <p><%=p.getcNumber()%></p>
                <p>Your Card CVC is:</p>
                <p><%=p.getcCVC()%></p>
                <p>Your Card Expiry Date is:</p>
                <p><%=p.getcExMMYY()%></p>
                <div class="buttons">
                    <input class="button" type="submit" name="paymentSubmitButton" value="Pay Now">
                    <input class="button" type="submit" name="paymentSubmitButton" value="Edit Payment Details">
                    <input class="button" type="submit" name="paymentSubmitButton" value="Cancel Payment">

                </div>
        </form>


    </div>
</body>
</html>
