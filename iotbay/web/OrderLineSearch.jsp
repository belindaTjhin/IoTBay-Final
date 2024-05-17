<%@page import="java.util.ArrayList"%>
<%@page import="uts.isd.model.Orderline"%>
<%@page import="uts.isd.model.Orders"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search OrderLine</title>
        <link rel="stylesheet" href="css/democss.css">

    </head>
    <body>
        <div class="nav">
            <div class='login-box'>
                <h1>Search:</h1>
                <form action="OrderLineSearchServlet" method='get'>
                    <label for="orderlineid"> OrderLine ID:</label><br>
                    <input type= 'number' name ='orderlineid'><br><br>
                <br><br>
                <div class='buttons'>
                    <input class='button' type="submit" value="Search">
                     <a class="button" href="payment_list.jsp">Cancel</a>
                </div>
            </div>
            <div>
                <div class="button-group">    
            </div>
            </form>
        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
