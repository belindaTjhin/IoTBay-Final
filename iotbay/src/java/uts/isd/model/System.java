/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;
import java.io.Serializable;
/**
 *
 * @author peter
 */ 

public class System implements Serializable {
    private String email;
    private String password;
    
    // Default constructor
    public System() {
        
    }

    // Constructor with all properties
    public System(String email,  String password) {
        this.email = email;
        this.password = password;
    }
    
      // Getters and setters for all properties
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
*/





