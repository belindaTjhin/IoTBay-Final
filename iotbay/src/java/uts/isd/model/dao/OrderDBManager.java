package uts.isd.model.dao;

import uts.isd.model.Orders;
import java.sql.*;
import java.math.BigDecimal;

public class OrderDBManager {
    private Connection conn;

    public OrderDBManager(Connection conn) throws SQLException {
        this.conn = conn;
    }

    public Orders findOrder(int orderID) throws SQLException {
        String fetch = "SELECT * FROM orders WHERE orderID = ?";
        try (PreparedStatement statement = conn.prepareStatement(fetch)) {
            statement.setInt(1, orderID);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                int oID = rs.getInt("orderID");
                String userEmail = rs.getString("userEmail");
                Date orderDate = rs.getDate("orderDate");
                BigDecimal price = rs.getBigDecimal("price");
                String shippingAddress = rs.getString("shippingAddress");
                return new Orders(oID, userEmail, orderDate, price, shippingAddress);
            }
        }
        return null;
    }

    public void addOrder(Orders order) throws SQLException {
        String sql = "INSERT INTO orders (orderID, userEmail, orderDate, price, shippingAddress) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, order.getOrderID());
            pstmt.setString(2, order.getUserEmail());
            pstmt.setDate(3, new java.sql.Date(order.getOrderDate().getTime()));
            pstmt.setBigDecimal(4, order.getPrice());
            pstmt.setString(5, order.getShippingAddress());
            pstmt.executeUpdate();
        }
    }

    public int getNextOrderID() throws SQLException {
        String query = "SELECT MAX(orderID) FROM orders";
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        }
        return 1; // Default starting ID
    }
}
