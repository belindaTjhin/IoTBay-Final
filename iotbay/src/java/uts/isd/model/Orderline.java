package uts.isd.model;

import java.io.Serializable;
import java.math.BigDecimal;

public class Orderline implements Serializable {
    private int orderlineID;
    private int orderID;
    private int quantity;
    private int productID;
    private String productName;
    private BigDecimal totalPrice;
    private BigDecimal price;

    public Orderline() {
    }

    public Orderline(int orderID, int quantity, int productID, String productName, BigDecimal price) {
        this.orderID = orderID;
        this.quantity = quantity;
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.totalPrice = price.multiply(BigDecimal.valueOf(quantity));
    }

    public Orderline(int orderlineID, int orderID, int quantity, int productID, String productName, BigDecimal totalPrice, BigDecimal price) {
        this.orderlineID = orderlineID;
        this.orderID = orderID;
        this.quantity = quantity;
        this.productID = productID;
        this.productName = productName;
        this.totalPrice = totalPrice;
        this.price = price;
    }

    public int getOrderlineID() {
        return orderlineID;
    }

    public void setOrderlineID(int orderlineID) {
        this.orderlineID = orderlineID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        this.totalPrice = this.price.multiply(BigDecimal.valueOf(this.quantity));
    }

    public void upQuantity() {
        this.quantity++;
        this.totalPrice = this.price.multiply(BigDecimal.valueOf(this.quantity));
    }

    public int downQuantity() {
        this.quantity--;
        this.totalPrice = this.price.multiply(BigDecimal.valueOf(this.quantity));
        return this.quantity;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
