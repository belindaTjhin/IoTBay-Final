/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author Shirley Yi
 */
public class Payment implements Serializable {
    private int orderID;
    private int paymentID;
    private String date;
    private String cardHolderName;
    private String cardNumber;
    private String cardCVC;
    private String cardExpiryMM;
    private String cardExpiryYY;
    private boolean isFinalised;

    public Payment() {
    }

    public Payment(int orderID, int paymentID, String date, String cardHolderName, String cardNumber, String cardCVC, String cardExpiryMM, String cardExpiryYY, boolean isFinalised) {
        this.orderID = orderID;
        this.paymentID = paymentID;
        this.date = date;
        this.cardHolderName = cardHolderName;
        this.cardNumber = cardNumber;
        this.cardCVC = cardCVC;
        this.cardExpiryMM = cardExpiryMM;
        this.cardExpiryYY = cardExpiryYY;
        this.isFinalised = isFinalised;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCardHolderName() {
        return cardHolderName;
    }

    public void setCardHolderName(String cardHolderName) {
        this.cardHolderName = cardHolderName;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardCVC() {
        return cardCVC;
    }

    public void setCardCVC(String cardCVC) {
        this.cardCVC = cardCVC;
    }

    public String getCardExpiryMM() {
        return cardExpiryMM;
    }

    public void setCardExpiryMM(String cardExpiryMM) {
        this.cardExpiryMM = cardExpiryMM;
    }

    public String getCardExpiryYY() {
        return cardExpiryYY;
    }

    public void setCardExpiryYY(String cardExpiryYY) {
        this.cardExpiryYY = cardExpiryYY;
    }

    public boolean isIsFinalised() {
        return isFinalised;
    }

    public void setIsFinalised(boolean isFinalised) {
        this.isFinalised = isFinalised;
    }
    
}    
