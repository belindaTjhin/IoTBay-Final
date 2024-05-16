<%-- 
    Document   : payment_complete
    Created on : 16/05/2024, 8:42:30 AM
    Author     : yixia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Complete</title>
        <link rel="stylesheet" href="css/democss.css">
    </head>
    <body>
        <div class="login-box">
            <h1>Thank you for your payment!</h1>
            <a class="button" href="index.jsp">Back to main page</a>
        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
