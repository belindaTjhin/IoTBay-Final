/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

import java.io.Serializable;

public class AccessLog implements Serializable {
    private String email;
    private String login_time;
    private String logout_time;


    // Default constructor
    public AccessLog() {
        
    }

    // Constructor with all properties
    public AccessLog(String email, String login_time, String logout_time) {
        this.email = email;
        this.login_time = login_time;
        this.logout_time = logout_time;
    }

    // Getters and setters for all properties
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLoginTime() {
        return login_time;
    }

    public void setLoginTime(String name) {
        this.login_time = name;
    }

    public String getLogoutTime() {
        return logout_time;
    }

    public void setLogoutTime(String password) {
        this.logout_time = password;
    }
}

