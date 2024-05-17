package uts.isd.model.dao;

import static java.lang.String.format;
import java.math.BigDecimal;
import uts.isd.model.User;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import uts.isd.model.Admin;
import uts.isd.model.System;
import uts.isd.model.Product;
import uts.isd.model.AccessLog;
import uts.isd.model.Customer;
import uts.isd.model.Orders;
import uts.isd.model.Payment;

/*  
* DBManager is the primary DAO class to interact with the database.  
* Complete the existing methods of this classes to perform CRUD operations with the db. 
 */
public class DBManager {

    private Statement st;
    private Connection conn;

    public DBManager(Connection conn) throws SQLException {
        st = conn.createStatement();
        this.conn = conn;
        
    }


    //Find user by email and password in the database    
    public User findUser(String email, String password) throws SQLException {

        //setup the select sql query string 
        String fetch = "select * from IOTUSER.USERS where EMAIL = '" + email + "' and PASSWORD='" + password + "'";

        //execute this query using the statement field 
        ResultSet rs = st.executeQuery(fetch);

        //add the results to a ResultSet  
        while (rs.next()) { // reads every row in USERS table 
            String userEmail = rs.getString(1);
            String userPass = rs.getString(3);

            if (userEmail.equals(email) && userPass.equals(password)) {
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
    public void updateUser(String oldEmail, String newEmail, String name, String oldPassword, String newPassword, String gender, String address) throws SQLException {
        //code for update-operation  
        st.executeUpdate("UPDATE IOTUSER.USERS SET EMAIL='" + newEmail + "', NAME='" + name + "', PASSWORD='" + newPassword + "', GENDER='" + gender + "', ADDRESS='" + address + "' WHERE EMAIL='" + oldEmail + "'");
    }

    //update a admin details in the database    
    public void updateAdmin(String oldEmail, String newEmail, String name, String oldPassword, String newPassword, String gender, String address) throws SQLException {
        //code for update-operation  
        st.executeUpdate("UPDATE IOTUSER.ADMIN SET EMAIL='" + newEmail + "', NAME='" + name + "', PASSWORD='" + newPassword + "', GENDER='" + gender + "', ADDRESS='" + address + "' WHERE EMAIL='" + oldEmail + "'");
    }

    //delete a user from the database    
    public void deleteUser(String email) throws SQLException {
        //code for delete-operation    
        st.executeUpdate("DELETE FROM IOTUSER.USERS WHERE EMAIL='" + email + "'");

    }

    public ArrayList<User> fetchUser() throws SQLException {
        String fetch = "select * from USERS";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<User> temp = new ArrayList();

        while (rs.next()) {
            String email = rs.getString(1);
            String name = rs.getString(2);
            String password = rs.getString(3);
            String gender = rs.getString(4);
            String address = rs.getString(5);
            temp.add(new User(email, name, password, gender, address));
        }
        return temp;
    }

    public boolean checkUser(String email, String password) throws SQLException {
        String fetch = "select * from IOTUSER.USERS where EMAIL= '" + email + "' and PASSWORD='" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String userEmail = rs.getString(1);
            String userPass = rs.getString(3);
            if (userEmail.equals(email) && userPass.equals(password)) {
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
        while (rs.next()) { // reads every row in ADMIN table 
            String adminEmail = rs.getString(1);
            String adminPass = rs.getString(3);

            if (adminEmail.equals(email) && adminPass.equals(password)) {
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
    public void updateAdmin(String email, String name, String password, String gender, String address) throws SQLException {
        //code for update-operation  
        st.executeUpdate("UPDATE IOTUSER.ADMIN SET NAME='" + name + "', PASSWORD='" + password + "', GENDER='" + gender + "', ADDRESS='" + address + "' WHERE EMAIL='" + email + "'");
    }

    //delete a ADMIN from the database    
    public void deleteAdmin(String email) throws SQLException {
        //code for delete-operation    
        st.executeUpdate("DELETE FROM IOTUSER.ADMIN WHERE EMAIL='" + email + "'");

    }

    public ArrayList<Admin> fetchAdmin() throws SQLException {
        String fetch = "select * from ADMIN";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Admin> temp = new ArrayList();

        while (rs.next()) {
            String email = rs.getString(1);
            String name = rs.getString(2);
            String password = rs.getString(3);
            String gender = rs.getString(4);
            String address = rs.getString(5);
            temp.add(new Admin(email, name, password, gender, address));
        }
        return temp;
    }

    public boolean checkAdmin(String email, String password) throws SQLException {
        String fetch = "select * from IOTUSER.Admin where EMAIL= '" + email + "' and PASSWORD='" + password + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String adminEmail = rs.getString(1);
            String adminPass = rs.getString(3);
            if (adminEmail.equals(email) && adminPass.equals(password)) {
                return true;
            }
        }
        return false;
    }

    //Find PRODUCT by name in the database 
    public Product findDevice(String name) throws SQLException {

        //setup the select sql query string 
        String fetch = "select * from IOTUSER.DEVICES where NAME = '" + name + "'";

        //execute this query using the statement field 
        ResultSet rs = st.executeQuery(fetch);

        //add the results to a ResultSet  
        while (rs.next()) { // reads every row in ADMIN table 
            String deviceName = rs.getString(2);

            if (deviceName.equals(name)) {
                int deviceID = rs.getInt(1);
                String description = rs.getString(3);
                double price = rs.getDouble(4);
                String supplier = rs.getString(5);
                int stock = rs.getInt(6);
                return new Product(deviceID, deviceName, description, price, supplier, stock);
            }
        }
        //search the ResultSet for a admin using the parameters                
        return null;
    }

    //Add a device into the database    
    public void addDevice(int id, String name, String description, double price, String supplier, int stock) throws SQLException {
        //code for add-operation        
        st.executeUpdate("INSERT INTO IOTUSER.DEVICES (ID, NAME, DESCRIPTION, PRICE, SUPPLIER, STOCK) VALUES (" + id + ", '" + name + "', '" + description + "', " + price + ", '" + supplier + "', " + stock + ")");
    }

    //update a device details in the database    
    public void updateDevice(int id, String name, String description, double price, String supplier, int stock) throws SQLException {
        //code for update-operation  
        st.executeUpdate("UPDATE IOTUSER.DEVICES SET ID='" + id + "', DESCRIPTION='" + description + "', PRICE='" + price + "', SUPPLIER='" + supplier + "', STOCK=" + stock + "' WHERE NAME='" + name + "'");
    }

    public void updateDevice(int id, String oldName, String newName, String description, double price, String supplier, int stock) throws SQLException {
        //code for update-operation  
        st.executeUpdate("UPDATE IOTUSER.DEVICES SET ID='" + id + "', NAME='" + newName + "', DESCRIPTION='" + description + "', PRICE='" + price + "', SUPPLIER='" + supplier + "', STOCK='" + stock + "' WHERE NAME='" + oldName + "'");
    }

    //delete a PRODUCT from the database    
    public void deleteDevice(String name) throws SQLException {
        //code for delete-operation    
        st.executeUpdate("DELETE FROM IOTUSER.DEVICES WHERE NAME='" + name + "'");

    }

    public ArrayList<Product> fetchDevice() throws SQLException {
        String fetch = "select * from IOTUSER.DEVICES";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Product> temp = new ArrayList();

        while (rs.next()) {
            int id = rs.getInt(1);
            String name = rs.getString(2);
            String description = rs.getString(3);
            double price = rs.getDouble(4);
            String supplier = rs.getString(5);
            int stock = rs.getInt(6);
            temp.add(new Product(id, name, description, price, supplier, stock));
        }
        return temp;
    }
    
        public List<Customer> findAllCustomers() throws SQLException {
            String query = "SELECT * FROM IOTUSER.USERS";
            PreparedStatement ps = st.getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            List<Customer> customers = new ArrayList<>();

            while (rs.next()) {
                int id = rs.getInt("id");
                String email = rs.getString("email");
                String name = rs.getString("name");
                String password = rs.getString("password");
                String gender = rs.getString("gender");
                String address = rs.getString("address");
                String type = rs.getString("type");
                customers.add(new Customer(id, email, name, password, gender, address, type));
            }

            return customers;
        }
        
        public void addCustomer(String email, String name, String password, String gender, String address, String type) throws SQLException {
        String query = "INSERT INTO IOTUSER.USERS (email, name, password, gender, address, type) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, name);
        pstmt.setString(3, password);
        pstmt.setString(4, gender);
        pstmt.setString(5, address);
        pstmt.setString(6, type);
        pstmt.executeUpdate();
    }
        
        public void deleteCustomer(int id) throws SQLException {
        String query = "DELETE FROM IOTUSER.USERS WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, id);
        pstmt.executeUpdate();
    }
    
    public Customer findCustomer(int id) throws SQLException {
        String query = "SELECT * FROM IOTUSER.USERS WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, id);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            String email = rs.getString("email");
            String name = rs.getString("name");
            String password = rs.getString("password");
            String gender = rs.getString("gender");
            String address = rs.getString("address");
            String type = rs.getString("type");
            return new Customer(id, email, name, password, gender, address, type);
        }
        return null;
    }
    
    public void deleteCustomerRecord(int id) throws SQLException {
        String query = "DELETE FROM IOTUSER.USERS WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, id);
        pstmt.executeUpdate();
    }

    public void updateCustomer(Customer customer) throws SQLException {
        String query = "UPDATE IOTUSER.USERS SET email = ?, name = ?, password = ?, gender = ?, address = ?, type = ? WHERE id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, customer.getEmail());
        pstmt.setString(2, customer.getName());
        pstmt.setString(3, customer.getPassword());
        pstmt.setString(4, customer.getGender());
        pstmt.setString(5, customer.getAddress());
        pstmt.setString(6, customer.getType());
        pstmt.setInt(7, customer.getId());
        pstmt.executeUpdate();
    }

    public boolean checkDevice(String name) throws SQLException {
        String fetch = "select * from IOTUSER.DEVICES where NAME= '" + name + "'";
        ResultSet rs = st.executeQuery(fetch);

        while (rs.next()) {
            String deviceName = rs.getString(2);
            if (deviceName.equals(name)) {
                return true;
            }
        }
        return false;
    }

    //Add admin access log into the database    
    public void addAdminLog(String email, String login_time, String logout_time) throws SQLException {
        //code for add-operation        
        st.executeUpdate("INSERT INTO IOTUSER.ADMIN_ACCESS_LOG " + "VALUES ('" + email + "', '" + login_time + "', '" + logout_time + "')");
    }
    //Add user access log into the database    

    public void addUserLog(String email, String login_time, String logout_time) throws SQLException {
        //code for add-operation        
        st.executeUpdate("INSERT INTO IOTUSER.USER_ACCESS_LOG " + "VALUES ('" + email + "', '" + login_time + "', '" + logout_time + "')");
    }

    public ArrayList<AccessLog> fetchAccessLog(String email, String date) throws SQLException {

        String fetch = "SELECT * FROM USER_ACCESS_LOG WHERE email = '" + email + "' AND DATE(LOGIN_TIME)='" + date + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<AccessLog> temp = new ArrayList();

        while (rs.next()) {
            email = rs.getString(1);
            date = rs.getString(2);
            String logoutTime = rs.getString(3);

            temp.add(new AccessLog(email, date, logoutTime));
        }
        return temp;
    }

    public ArrayList<AccessLog> fetchAdminAccessLog(String email, String date) throws SQLException {

        String fetch = "SELECT * FROM ADMIN_ACCESS_LOG WHERE email = '" + email + "' AND DATE(LOGIN_TIME)='" + date + "'";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<AccessLog> temp = new ArrayList();

        while (rs.next()) {
            email = rs.getString(1);
            date = rs.getString(2);
            String logoutTime = rs.getString(3);

            temp.add(new AccessLog(email, date, logoutTime));
        }
        return temp;
    }

    //Find SYSTEM by email and password in the database    
    public System findSystem(String email, String password) throws SQLException {

        //setup the select sql query string 
        String fetch = "select * from IOTUSER.SYSTEMADMIN where EMAIL = '" + email + "' and PASSWORD='" + password + "'";

        //execute this query using the statement field 
        ResultSet rs = st.executeQuery(fetch);

        //add the results to a ResultSet  
        while (rs.next()) { // reads every row in SYSTEM table 
            String systemEmail = rs.getString(1);
            String systemPass = rs.getString(2);

            if (systemEmail.equals(email) && systemPass.equals(password)) {
                return new System(systemEmail, systemPass);
            }
        }
        //search the ResultSet for a admin using the parameters                
        return null;
    }

    //Add a payment into the database    
    public void addPayment(int paymentID, int orderID, String email, java.util.Date date, String cHName, String cNumber, String cCVC, String cExMMYY, boolean isFinalised) throws SQLException {
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        String query = "INSERT INTO PAYMENTS (paymentID, orderID, email, date, cHName, cNumber, cCVC, cExMMYY, isFinalised) VALUES (" + paymentID + ", " + orderID + ", '" + email + "', '" + sqlDate + "', '" + cHName + "', '" + cNumber + "', '" + cCVC + "', '" + cExMMYY + "', " + isFinalised + ")";
        st.executeUpdate(query);
    }
    //update a payment details in the database    

    public void updatePayment(int paymentID, int orderID, String email, java.util.Date date, String cHName, String cNumber, String cCVC, String cExMMYY, boolean isFinalised) throws SQLException {

        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        //code for update-operation
        st.executeUpdate("UPDATE PAYMENTS SET orderID=" + orderID + ", email='" + email + "', date='" + sqlDate + "', cHName='" + cHName + "', cNumber='" + cNumber + "', cCVC='" + cCVC + "', cExMMYY='" + cExMMYY + "', isFinalised=" + isFinalised + " WHERE paymentID=" + paymentID);
    }

    //delete a Payment Record from the database    
    public void deletePayment(int paymentID) throws SQLException {
        String query = "DELETE FROM IOTUSER.PAYMENTS WHERE paymentID=" + paymentID;
        st.executeUpdate(query);
    }

    //delete a Payment Record from the database    
    public void finalisePayment(int paymentID) throws SQLException {
        st.executeUpdate("UPDATE PAYMENTS SET isFinalised=" + true + " WHERE paymentID=" + paymentID);
    }

    //find payment history with paymentID and date
    public Payment findPayment(int paymentID, java.util.Date date) throws SQLException {
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        String query = "SELECT * FROM IOTUSER.Payments WHERE paymentID=" + paymentID + " AND date='" + sqlDate + "'";
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            paymentID = rs.getInt("paymentID");
            int orderID = rs.getInt("orderID");
            String email = rs.getString("email");
            date = rs.getDate("date");
            String cHName = rs.getString("cHName");
            String cNumber = rs.getString("cNumber");
            String cCVC = rs.getString("cCVC");
            String cExMMYY = rs.getString("cExMMYY");
            boolean isFinalised = rs.getBoolean("isFinalised");
            return new Payment(paymentID, orderID, email, date, cHName, cNumber, cCVC, cExMMYY, isFinalised);
        }
        return null;
    }
    //check if payment exists with orderID

    public BigDecimal findTotal(int orderID) throws SQLException {
        String query = "SELECT * FROM IOTUSER.Orders WHERE orderID=" + orderID;
        ResultSet rs = st.executeQuery(query);
        if (rs.next()) {
            BigDecimal price = rs.getBigDecimal("price");
            return price;
        }
        return null;
    }
    
    public boolean orderExist(int orderID) throws SQLException {
        String query = "SELECT * FROM IOTUSER.Orders WHERE orderID=" + orderID;
        ResultSet rs = st.executeQuery(query);
        if (rs.next()) {
            return true;
        }
        return false;
    }
    //check if payment exists with orderID

    public Payment findPayment(int orderID) throws SQLException {
        String query = "SELECT * FROM IOTUSER.Payments WHERE orderID=" + orderID;
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {
            int paymentID = rs.getInt("paymentID");
            orderID = rs.getInt("orderID");
            String email = rs.getString("email");
            java.util.Date date = rs.getDate("date");
            String cHName = rs.getString("cHName");
            String cNumber = rs.getString("cNumber");
            String cCVC = rs.getString("cCVC");
            String cExMMYY = rs.getString("cExMMYY");
            boolean isFinalised = rs.getBoolean("isFinalised");
            return new Payment(paymentID, orderID, email, date, cHName, cNumber, cCVC, cExMMYY, isFinalised);
        }
        return null;
    }

    //find payment history
    public ArrayList<Payment> fetchPayment(String useremail) throws SQLException {
        String query = "select * from IOTUSER.Payments where email='" + useremail + "'";
        ResultSet rs = st.executeQuery(query);
        ArrayList<Payment> temp = new ArrayList<Payment>();

        while (rs.next()) {
            int paymentID = rs.getInt("paymentID");
            int orderID = rs.getInt("orderID");
            String email = rs.getString("email");
            java.util.Date date = rs.getDate("date");
            String cHName = rs.getString("cHName");
            String cNumber = rs.getString("cNumber");
            String cCVC = rs.getString("cCVC");
            String cExMMYY = rs.getString("cExMMYY");
            boolean isFinalised = rs.getBoolean("isFinalised");
            temp.add(new Payment(paymentID, orderID, email, date, cHName, cNumber, cCVC, cExMMYY, isFinalised));
        }
        return temp;
    }
}
