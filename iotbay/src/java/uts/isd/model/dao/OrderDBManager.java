/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model.dao;

import uts.isd.model.Orders;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author tayla
 */
public class OrderDBManager {
    private Statement st; //used to execute SQL queries within java code
    
    public OrderDBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
    }
    
    public Orders findOrder(int oID, String uE) throws SQLException {
        String fetch = "select * from isd.ORDERS where orderID = " + oID + " and userEmail='" + uE + "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while (rs.next()) {  // reads every row in USERS table and gets the result by index and stores them into Strings
            int orderID = rs.getInt(1);
            String useremail = rs.getString(2);
            if (orderID == oID && useremail == uE) {
                String orderDate = rs.getString(3);
                double totalPrice = rs.getDouble(5);
                String shippingAddress = rs.getString(6);
                return new Orders(orderID, useremail, orderDate,totalPrice, shippingAddress);
                
            }
            
        }
        return null;
    }
    
    public void addOrder(int orderID, String useremail) throws SQLException {
        st.executeUpdate("INSERT INTO IOTBAY.ORDERS VALUES ("+orderID+", '" +useremail+"', null, null, null, null, null)");
              
        
          
    }
    
    public void updateOrder(int orderID, String useremail, String orderDate, double totalPrice, String shippingAddress) throws SQLException {
        st.executeUpdate("UPDATE IOTBAY.ORDERS SET ORDERDATE='"+orderDate+"',TOTALPRICE="+totalPrice+",SHIPPINGADDRESS='"+
                shippingAddress+"' WHERE ORDERID="+orderID + " AND USERID='"+useremail+"'");
    }
    
    public void deleteOrder(int orderID) throws SQLException {
        st.executeUpdate("DELETE FROM IOTBAY.ORDERS WHERE ORDERID=" +orderID+"");
    }
    
    public ArrayList<Orders> fetchOrders(String useremail) throws SQLException {
        String fetch = "select * from ORDERS where USEREMAIL='"+useremail+"'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Orders> temp = new ArrayList();
        
        while (rs.next()) {
            int orderID = rs.getInt(1);
            String orderDate = rs.getString(3);
            double totalPrice = rs.getDouble(5);
            String shippingAddress = rs.getString(6);
            temp.add(new Orders(orderID, useremail, orderDate, totalPrice, shippingAddress));
        }
        return temp;
    }
    
    
    
}