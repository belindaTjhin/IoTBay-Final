package uts.isd.model;

import java.io.Serializable;

public class Customer extends User implements Serializable {
    private int id; // Unique identifier for the customer
    private String type; // Additional property for customer type (Company/Individual)

    // Default constructor
    public Customer() {
        super();
    }

    // Constructor with all properties
    public Customer(int id, String email, String name, String password, String gender, String address, String type) {
        super(email, name, password, gender, address);
        this.id = id;
        this.type = type;
    }

    // Getters and setters for new properties
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    // Override getters from User class to be accessible from Customer class
    @Override
    public String getEmail() {
        return super.getEmail();
    }

    @Override
    public String getName() {
        return super.getName();
    }

    @Override
    public String getPassword() {
        return super.getPassword();
    }

    @Override
    public String getGender() {
        return super.getGender();
    }

    @Override
    public String getAddress() {
        return super.getAddress();
    }
}
