package uts.isd.model.dao;

import uts.isd.model.Orderline;
import java.sql.*;
import java.math.BigDecimal;
import java.util.ArrayList;

public class OrderLineDBManager {
    private Connection conn;

    public OrderLineDBManager(Connection conn) throws SQLException {
        this.conn = conn;
    }

    public Orderline findOrderLine(int orderID, int productID) throws SQLException {
        String fetch = "SELECT * FROM IOTUSER.Orderline WHERE orderID = ? AND productID = ?";
        try (PreparedStatement statement = conn.prepareStatement(fetch)) {
            statement.setInt(1, orderID);
            statement.setInt(2, productID);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                int orderLineID = rs.getInt("orderLineID");
                int quantity = rs.getInt("quantity");
                String productName = rs.getString("productName");
                BigDecimal totalPrice = rs.getBigDecimal("totalPrice");
                BigDecimal price = rs.getBigDecimal("price");
                return new Orderline(orderLineID, orderID, quantity, productID, productName, totalPrice, price);
            }
        }
        return null;
    }

    public void addOrderLine(Orderline orderLine) throws SQLException {
        String query = "INSERT INTO IOTUSER.Orderline (orderLineID, orderID, quantity, productID, productName, totalPrice, price) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, orderLine.getOrderlineID());
            pstmt.setInt(2, orderLine.getOrderID());
            pstmt.setInt(3, orderLine.getQuantity());
            pstmt.setInt(4, orderLine.getProductID());
            pstmt.setString(5, orderLine.getProductName());
            pstmt.setBigDecimal(6, orderLine.getTotalPrice());
            pstmt.setBigDecimal(7, orderLine.getPrice());
            pstmt.executeUpdate();
        }
    }

    public int getNextOrderlineID() throws SQLException {
        String query = "SELECT MAX(orderLineID) FROM isd.Orderline";
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        }
        return 1; // Default starting ID
    }

    public ArrayList<Orderline> fetchOrderLines(int orderID) throws SQLException {
        String fetch = "SELECT * FROM IOTUSER.Orderline WHERE orderID = ?";
        ArrayList<Orderline> temp = new ArrayList<>();
        try (PreparedStatement pstmt = conn.prepareStatement(fetch)) {
            pstmt.setInt(1, orderID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int orderLineID = rs.getInt("orderLineID");
                int quantity = rs.getInt("quantity");
                int productID = rs.getInt("productID");
                String productName = rs.getString("productName");
                BigDecimal totalPrice = rs.getBigDecimal("totalPrice");
                BigDecimal price = rs.getBigDecimal("price");
                temp.add(new Orderline(orderLineID, orderID, quantity, productID, productName, totalPrice, price));
            }
        }
        return temp;
    }
}
