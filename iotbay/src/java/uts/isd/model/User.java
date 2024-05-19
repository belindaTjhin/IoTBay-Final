package uts.isd.model;

import java.io.Serializable;

public class User implements Serializable {
    private String email;
    private String name;
    private String password;
    private String gender;
    private String address;
    private String type; // Added type field

    // Default constructor
    public User() {
        
    }

    // Constructor with all properties
    public User(String email, String name, String password, String gender, String address) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.gender = gender;
        this.address = address;
    }
    
    // Overloaded constructor with type
    public User(String email, String name, String password, String gender, String address, String type) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.gender = gender;
        this.address = address;
        this.type = type;
    }

    // Getters and setters for all properties
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getType() {
        return type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
}
