package uts.isd.controller;

import java.io.Serializable;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpSession;

public class PaymentValidator implements Serializable {

    private String orderIDPattern = "^[0-9]+$";
    private String cardNumberPattern = "^\\d{16}$";
    private String cardExpiryMMYYPattern = "^(0[1-9]|1[0-2])/([0-9]{2})$";
    private String cardCVCPattern = "^\\d{3}$";
//    private String cardHolderNamePattern = "^[^0-9]+(?: [^0-9]+)*\\s*$";

    public PaymentValidator() {
    }

    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }

    public boolean validateOrderID(String orderID) {
        return validate(orderIDPattern, orderID);
    }

    public boolean validateCardNumber(String cardNumber) {
        return validate(cardNumberPattern, cardNumber);
    }

    public boolean validateCardExpiryMMYY(String cardExpiryMMYY) {
        if (cardExpiryMMYY == null || !validate(cardExpiryMMYYPattern, cardExpiryMMYY)) {
            return false;
        }

        String[] parts = cardExpiryMMYY.split("/");
        int month = Integer.parseInt(parts[0]);
        int year = Integer.parseInt("20" + parts[1]);

        java.util.Calendar now = java.util.Calendar.getInstance();
        int currentMonth = now.get(java.util.Calendar.MONTH) + 1;
        int currentYear = now.get(java.util.Calendar.YEAR);

        return year > currentYear || (year == currentYear && month >= currentMonth);
    }

    public boolean validateCardCVC(String cardCVC) {
        return validate(cardCVCPattern, cardCVC);
    }

//        public boolean validateCardHolderName(String cardHolderName) {
//        return validate(cardHolderNamePattern, cardHolderName); 
//    }
    public void clear(HttpSession session) {
        session.setAttribute("orderIDFErr", "");
        session.setAttribute("cardNumberFErr", "");
        session.setAttribute("expiryFError", "");
        session.setAttribute("paymentErr", "");
        session.setAttribute("cvvErr", "");
        session.setAttribute("orderNotExistErr", "");
        session.setAttribute("cardHNameFErr", "");
        session.setAttribute("createPaymentErr", "");
    }
}
