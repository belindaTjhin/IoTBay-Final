<%-- 
    Document   : payment_search
    Created on : 15/05/2024, 3:50:42 PM
    Author     : yixia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Payment</title>
        <link rel="stylesheet" href="css/democss.css">
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
        <div class='login-box'>
            <h1>Search:</h1>
            <form action="PaymentSearchServlet" method='get'>
                <label for="paymentID">Payment ID:</label><br>
                <input type='number'name="paymentID"><br><br>
                <label for="date">Payment Date:</label><br>
                <input type='date'name="date">
                <br><br>
                <div class="buttons">
                    <input class="button" type="submit" value="Search">
                    <a class="button" href="payment_list.jsp">Cancel</a>
                </div>
                <div class="button-group">

                </div>
            </form>
        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
