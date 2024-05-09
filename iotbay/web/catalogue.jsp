<%-- 
    Document   : catalogue
    Created on : 09/05/2024, 10:10:22 PM
    Author     : btjhi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IoT Device Catalogue</title>
        <link rel="stylesheet" href="css/democss.css">
    </head>
    <body>
        <div class="form-container">
            <div class='login-box'>
                <h1>Search:</h1>
                <input class='text'>
                <button class='button' type="submit">Submit</button>
            </div>
        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
