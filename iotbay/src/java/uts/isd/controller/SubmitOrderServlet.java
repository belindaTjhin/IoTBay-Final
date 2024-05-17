package uts.isd.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uts.isd.model.Orders;
import uts.isd.model.dao.OrderDBManager;
import uts.isd.model.dao.DBConnector;
import java.sql.Connection;
import uts.isd.model.Product;

@WebServlet("/SubmitOrderServlet")
public class SubmitOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String userEmail = request.getParameter("userEmail");
            String orderDateString = request.getParameter("orderDate");
            String shippingAddress = request.getParameter("shippingAddress");

            Date orderDate = new Date();
            if (orderDateString != null && !orderDateString.isEmpty()) {
                try {
                    orderDate = DATE_FORMAT.parse(orderDateString);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
            }

            DBConnector dbConnector = new DBConnector();
            Connection conn = dbConnector.getConnection();
            OrderDBManager orderDBManager = new OrderDBManager(conn);

            int orderID = orderDBManager.getNextOrderID();
            Orders order = new Orders(orderID, userEmail, orderDate, BigDecimal.ZERO, shippingAddress);
            orderDBManager.addOrder(order);

            response.sendRedirect("OrderLineForm.jsp?orderID=" + orderID);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("OrderForm.jsp?error=1");
        }
    }
}
