/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

import java.io.Serializable;

public class Admin implements Serializable {
    private String email;
    private String name;
    private String password;
    private String gender;
    private String address;

    // Default constructor
    public Admin() {
        
    }

    // Constructor with all properties
    public Admin(String email, String name, String password, String gender, String address) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.gender = gender;
        this.address = address;
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
}

