/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Belthazod Tello
 */

public class DatabaseConnector {
    private String host;
    private String uName;
    private String uPass;
    Connection connection;
    static DatabaseConnector dbConnector = new DatabaseConnector();
/**
 * A private DatabaseConnector following the singleton design pattern
 * 
 *
 */
    private DatabaseConnector() {
        host = "jdbc:mysql://localhost:3306/enrollment";
        uName = "root";
        uPass = "";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/survey?autoReconnect=true&user=root&password=";
            Connection conn = DriverManager.getConnection(url);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
 /**
 * @return <code>DatabaseConnector</code> the one and only DatabaseConnector instance 
 * 
 */
    public static DatabaseConnector getInstance(){
        return dbConnector;
    }
    /**
 * A method that queries from the set database based on the SQL statement given
 * and returns the result of the query in the form of a <code>ResultSet</code>
 *
 * @param queryStatement  The SQL statement to execute.  
 * @return <code>rs</code> The ResultSet based from the SQL Statement given.
 * @exception SQLException The SQL statement has an error.              
 */

    public ResultSet query(String queryStatement) throws SQLException{
        ResultSet rs = null;
        startConnection();
        PreparedStatement selectStatement = connection.prepareStatement(queryStatement);
        rs = selectStatement.executeQuery();
        return rs;
    }

/**
 * A method that queries from the set database based on the SQL statement and values to 
 * be passed as arguments in the <code>PreparedStatement</code> given
 * and returns the result of the query in the form of a <code>ResultSet</code>
 *
 * @param queryStatement  The SQL statement to execute.
 * @param values The given values mapped to the "?"s in the query Statement.
 * @return <code>rs</code> The ResultSet based from the SQL Statement given.
 * @exception SQLException The SQL statement has an error.              
 */
    public ResultSet query(String queryStatement, String[] values) throws SQLException{
        ResultSet rs = null;
        startConnection();
        PreparedStatement selectStatement = connection.prepareStatement(queryStatement);
        for(int i = 0; i < values.length; i++){
            selectStatement.setString( i+1 , values[i]);
        }
        rs = selectStatement.executeQuery();
        return rs;
    }
    
/**
 * A method that queries from the set database based on the SQL statement and values to 
 * be passed as arguments in the <code>PreparedStatement</code> given
 * and returns the result of the query in the form of a <code>ResultSet</code>
 *
 * @param queryStatement  The SQL statement to execute.
 * @param value The given value mapped to the "?" in the query Statement.
 * @return <code>rs</code> The ResultSet based from the SQL Statement given.
 * @exception SQLException The SQL statement has an error.              
 */
    public ResultSet query(String queryStatement, String value) throws SQLException{
        ResultSet rs = null;
        startConnection();
        PreparedStatement selectStatement = connection.prepareStatement(queryStatement);
        selectStatement.setString( 1 , value);
        rs = selectStatement.executeQuery();
        return rs;
    }

 /**
 * A method that deletes rows from the set database based on the SQL statement.
 * 
 *
 * @param umlStatement  The SQL delete statement to execute.
 * @param values The given values mapped to the "?"s in the query Statement.
 * @exception SQLException Throws this exception if the SQL statement has an error.
 */
    public void delete(String umlStatement, String[] values) throws SQLException{
        startConnection();
        PreparedStatement deleteStatement = connection.prepareStatement(umlStatement);
        for(int i = 0; i<values.length ; i++){
            deleteStatement.setString(i+1, values[i]);
        }
        deleteStatement.executeUpdate();
    }

 /**
 * A method that deletes a single row from the set database based on the SQL statement.
 * 
 *
 * @param umlStatement  The SQL delete statement to execute.
 * @param value The given values mapped to the "?"s in the query Statement.
 * @exception SQLException Throws this exception if the SQL statement has an error.
 */
    public void delete(String umlStatement, String value) throws SQLException{
        startConnection();
        PreparedStatement deleteStatement = connection.prepareStatement(umlStatement);
        deleteStatement.setString(1, value);
        deleteStatement.executeUpdate();
    }
/**
 * A method that adds new elements to the set database based on the SQL statement
 * and values to be stored matching each attribute.
 * 
 *
 * @param umlStatement  The SQL UML statement to execute.
 * @param values The given values mapped to the "?"s in the UML Statement.
 * @exception SQLException Throws this exception if the SQL statement has an error.
 */
    public void insert(String umlStatement, String[] values) throws SQLException{
        startConnection();
        PreparedStatement insertStatement = connection.prepareStatement(umlStatement);
        
        for(int i = 0; i<values.length ; i++){
            insertStatement.setString(i+1, values[i]);
        }
        
        insertStatement.executeUpdate();
        
    }
    
 /**
 * A method that adds a new element to the set database based on the SQL statement
 * and values to be stored matching each attribute.
 * 
 *
 * @param umlStatement  The SQL UML statement to execute.
 * @param value The given value mapped to the "?" in the UML Statement.
 * @exception SQLException Throws this exception if the SQL statement has an error.
 */
    public void insert(String umlStatement, String value) throws SQLException{
        startConnection();
        PreparedStatement insertStatement = connection.prepareStatement(umlStatement);
        insertStatement.setString(1, value);
        insertStatement.executeUpdate();
        
    }
    
    /**
 * A method that changes certain values of elements in the set database based on the SQL statement
 * 
 * 
 *
 * @param umlStatement  The SQL UML statement to execute.
 * @param values The values to be stored in the database
 * @param args  The given values mapped to the "?"s in the query Statement.
 * @exception SQLException Throws this exception if the SQL statement has an error.
 */
    public void update(String umlStatement, String[] values, String[] args) throws SQLException{
        startConnection();
        PreparedStatement insertStatement = connection.prepareStatement(umlStatement);
        
        for(int i = 0; i<values.length ; i++){
            insertStatement.setString(i+1, values[i]);
        }
        
        insertStatement.executeUpdate();
        
    }
    
        /**
 * A method that changes certain values of elements in the set database based on the SQL statement
 * 
 * 
 *
 * @param umlStatement  The SQL UML statement to execute.
 * @param values The values to be stored in the database
 * @param arg  The given value mapped to the "?"  in the query Statement.
 * @exception SQLException Throws this exception if the SQL statement has an error.
 */
    public void update(String umlStatement, String[] values, String arg) throws SQLException{
        startConnection();
        PreparedStatement insertStatement = connection.prepareStatement(umlStatement);
        int i = 0;
        
        for(; i<values.length ; i++){
            insertStatement.setString(i+1, values[i]);
        }
        
        insertStatement.setString(i+1, arg);
        insertStatement.executeUpdate();
        
    }
    
        /**
 * A method that adds new elements to the set database based on the SQL statement
 * and values to be stored matching each attribute.
 * 
 *
 * @param umlStatement  The SQL UML statement to execute.
 * @param values The values to be stored in the database
 * @exception SQLException Throws this exception if the SQL statement has an error.
 */
    public void update(String umlStatement, String[] values) throws SQLException{
        startConnection();
        PreparedStatement insertStatement = connection.prepareStatement(umlStatement);
        for(int i = 0; i<values.length ; i++){
            insertStatement.setString(i+1, values[i]);
        }
        
        insertStatement.executeUpdate();
        
    }
    
    public void startConnection(){
        try{
            connection = DriverManager.getConnection(host,uName, uPass);
        }catch(SQLException sqlE){
            sqlE.printStackTrace();
            //JOptionPane.showMessageDialog(null, "Failed to start Database connection", "Database error", JOptionPane.ERROR_MESSAGE);
        }
    }
    public void closeConnection(){
        try{
            connection.close();
        }catch(SQLException sqlE){
            sqlE.printStackTrace();
            JOptionPane.showMessageDialog(null, "Failed to close Database connection", "Database error", JOptionPane.ERROR_MESSAGE);
        }
    }
}
