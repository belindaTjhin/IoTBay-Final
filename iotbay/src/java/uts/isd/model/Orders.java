package uts.isd.model;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Orders implements Serializable {
    private static int numberOfOrders = 0;
    private int orderID;
    private String useremail;
    private Date orderDate;
    private BigDecimal totalPrice;
    private String shippingAddress;

    public Orders() {
    }

    public Orders(String useremail) {
        this.orderID = Orders.numberOfOrders;
        Orders.numberOfOrders++;
    }

    public Orders(int orderID, String useremail, Date orderDate, BigDecimal totalPrice, String shippingAddress) {
        this.orderID = orderID;
        this.useremail = useremail;
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

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }

    public void updatePrice(BigDecimal price, int quantity) {
        this.totalPrice = this.totalPrice.add(price.multiply(BigDecimal.valueOf(quantity)));
    }

    public void deleteOrderLine(BigDecimal totalPrice) {
        this.totalPrice = this.totalPrice.subtract(totalPrice);
    }

    public BigDecimal getPrice() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
