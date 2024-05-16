<%-- 
    Document   : payment_search_result
    Created on : 15/05/2024, 4:29:13 PM
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
            table, td, th {
                border: 1px solid;
            }
            table {
                text-align: center;
                width: 100%;
                border-collapse: collapse;
            }
        </style>
    </head>
    <body>
        <%
            Payment p = (Payment) session.getAttribute("payment");
        %>
        <div class="login-box">
            <h1>Search Result</h1> 
            <%
                if (p != null) {
            %>

            <table>
                <tr>
                    <th>Payment ID</th>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Card Holder Name</th>
                    <th>Card Number</th>
                    <th>ExpiryDDMM</th>
                    <th>CVC</th>
                    <th>Finalised</th>

                </tr>
                <tr>
                    <td><p><%=p.getPaymentID()%></p></td>
                    <td><p><%=p.getOrderID()%></p></td>
                    <td><p><%=p.getDate()%></p></td>
                    <td><p><%=p.getcHName()%></p></td>
                    <td><p><%=p.getcNumber()%></p></td>
                    <td><p><%=p.getcExMMYY()%></p></td>
                    <td><p><%=p.getcCVC()%></p></td>
                    <td><p><%=p.isFinalised()%></p></td>

                </tr>
                <%
                } else {
                %>
                <tr>
                    <td colspan="7">No payment matching the id and date found.</td>
                </tr>
            </table> <br>
            <%
                }
            %>
            <div class="button-group">
                <a href="payment_search.jsp">
                    <button class="button">Back</button>
                </a>
            </div>
        </div>
        <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
