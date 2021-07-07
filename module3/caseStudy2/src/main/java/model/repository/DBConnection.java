package model.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private String jdbcURL= "jdbc:mysql://localhost:3306/casestudy_furama_web?useSSL=false";
    private String jdbcUserName = "root";
    private String jdbcPassword ="0966997711";

    protected Connection getConnection() {
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
//    public static void main(String[] args) {
//        DBConnection connection=new DBConnection();
//
//        System.out.println("dda ket noi"+connection.getConnection());
//    }
}
