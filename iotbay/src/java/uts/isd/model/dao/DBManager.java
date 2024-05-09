package uts.isd.model.dao; 



import uts.isd.model.User; 

import java.sql.*; 

import java.util.ArrayList; 
import uts.isd.model.Admin;

/*  
* DBManager is the primary DAO class to interact with the database.  
* Complete the existing methods of this classes to perform CRUD operations with the db. 
*/ 

public class DBManager { 

    private Statement st; 

    public DBManager(Connection conn) throws SQLException {        
       st = conn.createStatement();    
    } 


    //Find user by email and password in the database    
    public User findUser(String email, String password) throws SQLException {        

       //setup the select sql query string 
       String fetch = "select * from IOTUSER.USERS where EMAIL = '" + email + "' and PASSWORD='" + password + "'"; 

       //execute this query using the statement field 
       ResultSet rs = st.executeQuery(fetch); 

       //add the results to a ResultSet  
       while(rs.next()){ // reads every row in USERS table 
           String userEmail = rs.getString(1); 
           String userPass = rs.getString(3); 

           if(userEmail.equals(email) && userPass.equals(password)){ 
               String userName = rs.getString(2); 
               String userGender = rs.getString(4); 
               String userAddress = rs.getString(5); 
               return new User(userEmail, userName, userPass, userGender, userAddress); 
           } 
       } 
       //search the ResultSet for a user using the parameters                
       return null;    
    } 



    //Add a user-data into the database    
    public void addUser(String email, String name, String password, String gender, String address) throws SQLException {                   
      //code for add-operation        
      st.executeUpdate("INSERT INTO IOTUSER.USERS " + "VALUES ('" + email + "', '" + name + "', '" + password + "', '" + gender + "', '" + address + "')");    
    } 


    //update a user details in the database    
    public void updateUser( String email, String name, String password, String gender, String address) throws SQLException {        
       //code for update-operation  
       st.executeUpdate("UPDATE IOTUSER.USERS SET NAME='" + name + "', PASSWORD='" + password + "', GENDER='" + gender + "', ADDRESS='" + address + "' WHERE EMAIL='" + email + "'"); 
    }        

    //delete a user from the database    
    public void deleteUser(String email) throws SQLException{        
       //code for delete-operation    
       st.executeUpdate("DELETE FROM IOTUSER.USERS WHERE EMAIL='" + email + "'"); 

    } 


    public ArrayList<User> fetchUser() throws SQLException{ 
        String fetch = "select * from USERS"; 
        ResultSet rs = st.executeQuery(fetch); 
        ArrayList<User> temp = new ArrayList(); 

        while(rs.next()){ 
            String email = rs.getString(1); 
            String name = rs.getString(2); 
            String password = rs.getString(3); 
            String gender = rs.getString(4); 
            String address = rs.getString(5); 
            temp.add(new User(email, name, password, gender, address)); 
        }
        return temp; 
    } 


    public boolean checkUser(String email, String password) throws SQLException{ 
        String fetch = "select * from IOTUSER.USERS where EMAIL= '" + email + "' and PASSWORD='" + password + "'"; 
        ResultSet rs = st.executeQuery(fetch); 

        while(rs.next()){ 
            String userEmail = rs.getString(1); 
            String userPass = rs.getString(3); 
            if(userEmail.equals(email) && userPass.equals(password)){ 
                return true; 
            } 
        } 
        return false; 
    } 
    
    //Find ADMIN by email and password in the database    
    public Admin findAdmin(String email, String password) throws SQLException {        

       //setup the select sql query string 
       String fetch = "select * from IOTUSER.ADMIN where EMAIL = '" + email + "' and PASSWORD='" + password + "'"; 

       //execute this query using the statement field 
       ResultSet rs = st.executeQuery(fetch); 

       //add the results to a ResultSet  
       while(rs.next()){ // reads every row in ADMIN table 
           String adminEmail = rs.getString(1); 
           String adminPass = rs.getString(3); 

           if(adminEmail.equals(email) && adminPass.equals(password)){ 
               String adminName = rs.getString(2); 
               String adminGender = rs.getString(4); 
               String adminAddress = rs.getString(5); 
               return new Admin(adminEmail, adminName, adminPass, adminGender, adminAddress); 
           } 
       } 
       //search the ResultSet for a admin using the parameters                
       return null;    
    } 



    //Add a admin-data into the database    
    public void addAdmin(String email, String name, String password, String gender, String address) throws SQLException {                   
      //code for add-operation        
      st.executeUpdate("INSERT INTO IOTUSER.ADMIN " + "VALUES ('" + email + "', '" + name + "', '" + password + "', '" + gender + "', '" + address + "')");    
    } 


    //update a admin details in the database    
    public void updateAdmin( String email, String name, String password, String gender, String address) throws SQLException {        
       //code for update-operation  
       st.executeUpdate("UPDATE IOTUSER.ADMIN SET NAME='" + name + "', PASSWORD='" + password + "', GENDER='" + gender + "', ADDRESS='" + address + "' WHERE EMAIL='" + email + "'"); 
    }        

    //delete a ADMIN from the database    
    public void deleteAdmin(String email) throws SQLException{        
       //code for delete-operation    
       st.executeUpdate("DELETE FROM IOTUSER.ADMIN WHERE EMAIL='" + email + "'"); 

    } 


    public ArrayList<Admin> fetchAdmin() throws SQLException{ 
        String fetch = "select * from ADMIN"; 
        ResultSet rs = st.executeQuery(fetch); 
        ArrayList<Admin> temp = new ArrayList(); 

        while(rs.next()){ 
            String email = rs.getString(1); 
            String name = rs.getString(2); 
            String password = rs.getString(3); 
            String gender = rs.getString(4); 
            String address = rs.getString(5); 
            temp.add(new Admin(email, name, password, gender, address)); 
        }
        return temp; 
    } 


    public boolean checkAdmin(String email, String password) throws SQLException{ 
        String fetch = "select * from IOTUSER.Admin where EMAIL= '" + email + "' and PASSWORD='" + password + "'"; 
        ResultSet rs = st.executeQuery(fetch); 

        while(rs.next()){ 
            String adminEmail = rs.getString(1); 
            String adminPass = rs.getString(3); 
            if(adminEmail.equals(email) && adminPass.equals(password)){ 
                return true; 
            } 
        } 
        return false; 
    } 
}