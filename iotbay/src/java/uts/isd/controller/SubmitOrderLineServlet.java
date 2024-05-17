package uts.isd.controller;

import java.io.IOException;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uts.isd.model.Orderline;
import uts.isd.model.dao.OrderLineDBManager;
import uts.isd.model.dao.DBConnector;
import java.sql.Connection;
import uts.isd.model.Product;

@WebServlet("/SubmitOrderLineServlet")
public class SubmitOrderLineServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int orderID = Integer.parseInt(request.getParameter("orderID"));
            int productID = Integer.parseInt(request.getParameter("productID"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String productName = "Product " + productID;
            BigDecimal price = BigDecimal.TEN; // Placeholder for product price
            BigDecimal totalPrice = price.multiply(BigDecimal.valueOf(quantity));

            DBConnector dbConnector = new DBConnector();
            Connection conn = dbConnector.getConnection();
            OrderLineDBManager orderLineDBManager = new OrderLineDBManager(conn);

            int orderlineID = orderLineDBManager.getNextOrderlineID();
            Orderline orderline = new Orderline(orderlineID, orderID, quantity, productID, productName, totalPrice, price);
            orderLineDBManager.addOrderLine(orderline);

            response.sendRedirect("OrderLineView.jsp?orderID=" + orderID);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("OrderLineForm.jsp?orderID=" + request.getParameter("orderID") + "&error=1");
        }
    }
}
