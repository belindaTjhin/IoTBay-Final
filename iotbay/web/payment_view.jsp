<%-- 
    Document   : payment_view
    Created on : 14/05/2024, 10:24:55 AM
    Author     : yixia
--%>
<%@page import="uts.isd.model.Payment"%>
<%@page import="uts.isd.model.Orders"%>
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
            .data {
                /*font-weight: bold;*/
                font-size:1.5em;
                margin: 0;
            }
            .name {
                margin-top: 15px;
                margin-bottom: 0;
            }
            .pay {
                padding: 5px 20px;
            }

        </style>
    </head>
    <body>
        <%
            Payment p = (Payment) session.getAttribute("updatedPayment");
            String total = (String) session.getAttribute("paymentTotal");

        %>
        <form action="PaymentConfirmServlet" method="post">
            <div class="login-box text-align-left">
                <h1>Confirm Payment</h1> 
                <div style="padding: 20px">
                    <p class="name">Your order ID is:</p>
                    <p class="data"><%=p.getOrderID()%></p>
                    <p class="name">Your CardHolder Name is:</p>
                    <p class="data"><%=p.getcHName()%></p>
                    <p class="name">Your Card Number is:</p>
                    <p class="data"><%=p.getcNumber()%></p>
                    <p class="name">Your Card CVC is:</p>
                    <p class="data"><%=p.getcCVC()%></p>
                    <p class="name">Your Card Expiry Date is:</p>
                    <p class="data"><%=p.getcExMMYY()%></p>
                    <p class="name">Your Total is:</p>
                    <p class="data">$<%=total%></p><br>
                    <div class="buttons">
                        <div>
                            <input class="button pay" type="submit" name="paymentSubmitButton" value="Pay Now"><br>
                        </div><br>
                        <input class="button" type="submit" name="paymentSubmitButton" value="Edit Payment Details">
                        <input class="button" type="submit" name="paymentSubmitButton" value="Cancel Payment">

                    </div>
                </div>
        </form>

        <jsp:include page="/ConnServlet" flush="true"/>
    </div>
</body>
</html>
