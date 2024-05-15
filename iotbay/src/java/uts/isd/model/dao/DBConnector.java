package uts.isd.model.dao;

 

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.SQLException;

 

public class DBConnector extends DB{

    public static Connection getConnection() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public DBConnector() throws ClassNotFoundException, SQLException {
        Class.forName(driver);
        conn = DriverManager.getConnection(URL+db, dbuser, dbpass);
    }



    public Connection openConnection(){
        return this.conn;
    }

 

    public void closeConnection() throws SQLException {
        this.conn.close();
    }

}