package project;
import java.sql.*;
public class ConnectionProvider {
    public static Connection getCon() {
        try{
        String dbDriver = "com.mysql.cj.jdbc.Driver";
        String dbURL = "jdbc:mysql://localhost:3306/ospjspdb";
        String dbUsername = "";
        String dbPassword = "";
        Class.forName(dbDriver); 
        Connection con = DriverManager.getConnection(dbURL , dbUsername, dbPassword);
        return con; 
        }
        catch(Exception e){
            System.out.print(e);
            return null;
        }
    }
}