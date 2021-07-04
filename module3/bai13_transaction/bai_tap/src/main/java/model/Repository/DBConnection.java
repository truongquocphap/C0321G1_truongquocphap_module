package model.Repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private String jdbcURL= "jdbc:mysql://localhost:3306/demo?useSSL=false";
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
//    private static final String USER_NAME = "root";
//    private static final String PASSWORD = "0966997711";
//    private static final String HOST = "localhost";
//    private static final String DATABASE = "demo";
//    private static final String PORT = "3306";
//
//    private static Connection connection;
//
//    public static Connection getConnection () {
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            connection = DriverManager.getConnection("jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE, USER_NAME, PASSWORD);
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        }
//        return connection;
//    }

//    public static void close(){
//        try {
//            if(connection != null){
//                connection.close();
//            }
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//    }
}
