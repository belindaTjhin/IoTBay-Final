package uts.isd.controller;

import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.*;
import uts.isd.model.AccessLog;
import uts.isd.model.User;
import uts.isd.model.dao.DBConnector;
import uts.isd.model.dao.DBManager;

public class TestDB {

    private static Scanner in = new Scanner(System.in);
    private DBConnector connector;
    private Connection conn;
    private DBManager db;
    
    public static void main(String[] args) throws SQLException {
        (new TestDB()).runQueries();
    }
    
    public TestDB(){
        try{
            connector = new DBConnector();
            conn = connector.openConnection();
            db = new DBManager(conn);
        } catch (ClassNotFoundException | SQLException ex){
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private char readChoice(){
        System.out.print("Operation CRUDS or * to exit: ");
        return in.nextLine().charAt(0);
    }
    
    private void runQueries() throws SQLException {
        char c;
        
        while ((c = readChoice()) != '*'){
            switch(c){
                case 'C':
                    testAdd();
                    break;
                case 'R':
                    testRead();
                    break;
                case 'U':
                    testUpdate();
                    break;
                case 'D':
                    testDelete();
                    break;
                case 'S':
                    showAll();
                    break;
                default:
                    System.out.println("Unknown Command");
            }
        }
    }
    
    private void testAdd(){
        System.out.print("User's name: ");
        String name = in.nextLine();
        System.out.print("User email: ");
        String email = in.nextLine();
        System.out.print("Password: ");
        String password = in.nextLine();
        System.out.print("Gender: ");
        String gender = in.nextLine();
        System.out.print("Address: ");
        String address = in.nextLine();
        
        try{
            db.addUser(email, name, password, gender, address);
        } catch (SQLException ex){
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        System.out.println("User is added to the database.");
    }
    
    // Testing add accesslog database function
        private void testAddLog(){
        System.out.print("email: ");
        String email = in.nextLine();
        System.out.print("login time ");
        String login_time = new Timestamp(System.currentTimeMillis()).toString();
        System.out.print("logout time");
        String logout_time = new Timestamp(System.currentTimeMillis()).toString();
        
        try{
            db.addUserLog(email, login_time, logout_time);
        } catch (SQLException ex){
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        System.out.println("User is added to the database.");
    }
    
    private void testRead() throws SQLException{
        System.out.print("User email: ");
        String email = in.nextLine();
        System.out.print("Password: ");
        String password = in.nextLine();
        User user = db.findUser(email, password);
        
        if(user != null){
            System.out.println("User " + user.getName() + " exists in the database.");
        } else {
            System.out.println("User does not exist.");
        }
    }
    
    private void testUpdate(){
        System.out.print("Old email: ");
        String oldEmail = in.nextLine();
        System.out.print("Password: ");
        String password = in.nextLine();
        
        try{
          if(db.checkUser(oldEmail, password)){
              System.out.print("New email: ");
              String newEmail = in.nextLine();
              System.out.print("User name: ");
              String name = in.nextLine();
              System.out.print("Gender: ");
              String gender = in.nextLine();
              System.out.print("Address: ");
              String address = in.nextLine();
              
              db.updateUser(oldEmail, newEmail, name, password, gender, address);
          } else {
              System.out.println("User does not exist.");
          }
        } catch (SQLException ex){
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void testDelete(){
        System.out.print("User email: ");
        String email = in.nextLine();
        System.out.print("Password: ");
        String password = in.nextLine();
        
        try{
            if(db.checkUser(email, password)){
                db.deleteUser(email);
            } else {
                System.out.println("User does not exist.");
            }
        } catch (SQLException ex){
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void showAll(){
       try{
           ArrayList<User> users = db.fetchUser();
           System.out.println("USERS TABLE: ");
           users.stream().forEach((user) -> {
               System.out.printf("%-20s %-30s %-20s %-10s \n", user.getName(), user.getEmail(), user.getPassword(), user.getGender(), user.getAddress());
           });
           System.out.println();
       } catch (SQLException ex){
           Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
       }
    }
    
    // Testing show accesslog database function
    private void showAllLog(){
       
        try{
           ArrayList<AccessLog> accessLogs = db.fetchAccessLog("delete3@example.com", "2024-05-10");
           System.out.println("AccessLog TABLE: ");
           accessLogs.stream().forEach((user) -> {
               System.out.printf("%-20s %-30s %-30s \n", user.getEmail(), user.getLoginTime(), user.getLogoutTime());
           });
           System.out.println();
       } catch (SQLException ex){
           Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
       }
    }
}
