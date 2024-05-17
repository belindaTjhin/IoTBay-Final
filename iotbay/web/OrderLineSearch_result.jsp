<%@page import="uts.isd.model.Orderline"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/democss.css">
        <title>Search Result</title>
        <style>
            .nav {
                position: absolute;
                top:20px;
                left:20px;
            }
        </style>
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
        <div class="nav">
           <a class="button" style="color:white" href="index.jsp">Back to Main Page</a>
        </div>
        <%
            Orderline o = (Orderline) session.getAttribute("orderlineid");
        %>
        <div class=login-box">
            <h1>Search Result</h1>
            <%
                if (o != null) {
            %>
            <table>
                <tr>
                    <th>OrderLine ID</th>
                    <th>Order ID</th>
                    <th>Quantity</th>
                    <th>Product ID</th>
                    <th>Prodcut Name</th>
                    <th>Total Price</th>
                    <th>Unit Pirce</th>
                </tr>
                <tr>
                    <td><p><%=o.getOrderlineID()%></p></td>
                    <td><p><%=o.getOrderID()%></p></td>
                    <td><p><%=o.getQuantity()%></p></td>
                    <td><p><%=o.getProductID()%></p></td>
                    <td><p><%=o.getProductName()%></p></td>
                    <td><p><%=o.getTotalPrice()%></p></td>
                    <td><p><%=o.getPrice()%></p></td>
                </tr>
                <%
                    } else {
                %>
                <tr>
                    <td colspan="7">No Orderline matching the id found.</td>
                </tr>
            </table> <br>
            <%
                }
            %>
            <div class="button-group">
                <a href="index.html">
                    <button class="button"> Back </button>
                </a>
            </div>
            <jsp:include page="/ConnServlet" flush="true"/>
    </body>
</html>
