
package uts.isd.model;
import java.io.Serializable;

public class Orders implements Serializable{
    private static int numberOfOrders = 0;
    private int orderID;
    private String useremail;
    private String orderDate;
    private double totalPrice;
    private String shippingAddress;
    
    
    public Orders(int orderID1, String useremail1, String orderDate1, double totalPrice1, String shippingAddress1) {
    
    }

    public Orders(String useremail) {
        
        this.orderID = Orders.numberOfOrders;
        Orders.numberOfOrders++;
    }

    public Orders(int orderID, String useremail, String orderDate, double tax, double totalPrice, String shippingAddress, String billingAddress) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.shippingAddress = shippingAddress;
    } 
    public int getOrderID() {
        return orderID;
    }
    
    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserEmail() {
        return useremail;
    }

    public void setUserEmail(String useremail) {
        this.useremail = useremail;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }
   
    public void updatePrice(double price, int quantity) {
        this.totalPrice = this.totalPrice + (price*quantity);
    }
    
    public void deleteOrderLine(double totalPrice) {
        this.totalPrice = this.totalPrice - totalPrice;
    }
    
}
