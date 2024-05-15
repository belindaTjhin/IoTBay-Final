/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Shirley Yi
 */
public class Payment implements Serializable {
    private int paymentID;
    private int orderID;
    private String email;
    private Date date;
    private String cHName;
    private String cNumber;
    private String cCVC;
    private String cExMMYY;
    private boolean Finalised;

    public Payment(int paymentID, int orderID, String email, Date date, String cHName, String cNumber, String cCVC, String cExMMYY, boolean Finalised) {
        this.paymentID = paymentID;
        this.orderID = orderID;
        this.email = email;
        this.date = date;
        this.cHName = cHName;
        this.cNumber = cNumber;
        this.cCVC = cCVC;
        this.cExMMYY = cExMMYY;
        this.Finalised = Finalised;
    }



    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getcHName() {
        return cHName;
    }

    public void setcHName(String cHName) {
        this.cHName = cHName;
    }

    public String getcNumber() {
        return cNumber;
    }

    public void setcNumber(String cNumber) {
        this.cNumber = cNumber;
    }

    public String getcCVC() {
        return cCVC;
    }

    public void setcCVC(String cCVC) {
        this.cCVC = cCVC;
    }

    public String getcExMMYY() {
        return cExMMYY;
    }

    public void setcExMMYY(String cExMMYY) {
        this.cExMMYY = cExMMYY;
    }

    public boolean isFinalised() {
        return Finalised;
    }

    public void setFinalised(boolean Finalised) {
        this.Finalised = Finalised;
    }
    

}