<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="uts.isd.model.dao.OrderLineDBManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="uts.isd.model.Orderline"%>
<%@page import="uts.isd.model.Orders"%>
<%@page import="uts.isd.model.Product"%>
<% 
    Orders order = (Orders)session.getAttribute("order");
    ArrayList<Orderline> orderLine = (ArrayList<Orderline>) session.getAttribute("Orderline");
    request.setAttribute("OrderLine", orderLine);
    session.setAttribute("orderLine", orderLine);
            %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        
        <h1>View Cart</h1>
        <table>
                <tr>
                    <th>Product Name</th>
                    <th></th>
                    <th>Quantity</th>
                    <th></th>
                    <th>Total Price</th>
                </tr>
        <c:forEach items="${orderLines}" var="orderLine">
            
            <tr>
                <td>${orderLine.productName}</td> 
                <td>
                    <form method="post" action="QuantityUp">
                    <input type="hidden" name="orderLineID" value="${orderLine.orderlineID}">
                    <input type="hidden" name="productID" value="${orderLine.productID}">
                    <input type="submit" value="Up">
                    </form>
                    </td>                
                <td>${orderLine.quantity}</td>
                <td><form method="post" action="QuantityDown">
                    <input type="hidden" name="orderLineID" value="${orderLine.orderlineID}">
                    <input type="hidden" name="productID" value="${orderLine.productID}">
                    <input type="submit" value="Down">
                    </form></td>
                <td>${orderLine.totalPrice}</td>
            </tr>
            
            
        </c:forEach>
            <tr></tr>
            <tr>
                <td>Total Price:</td>
                <td>${order.totalPrice}<td>
            </tr>
            </table>
            <% 
            session.setAttribute("totalPrice", order.getTotalPrice());
            %>
        <form action="ShippingServlet" method="post">
            <input type="submit" value="Continue to Shipping">
        </form>
    </body>
</html>
