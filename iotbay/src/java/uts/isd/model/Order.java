
package uts.isd.model;
import java.io.Serializable;

public class Order implements Serializable{
    private static int numberOfOrders = 0;
    private int orderID;
    private String useremail;
    private String orderDate;
    private double totalPrice;
    private String shippingAddress;
    
    
    public Order() {
    
    }

    public Order(String useremail) {
        
        this.orderID = Order.numberOfOrders;
        Order.numberOfOrders++;
    }

    public Order(int orderID, String useremail, String orderDate, double tax, double totalPrice, String shippingAddress, String billingAddress) {
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
