package model.repository;

import model.bean.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements CustomerRepository {
    private static final String SELECT_USER_BY_ID = "select customer_id,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address,customer_code from customer where customer_id = ? ";
    private static final String INSERT_CUSTOMER = "insert into customer (customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address , customer_code)" +
            " VALUES(?,?,?,?,?,?,?,?,?) ";
    private static final String SELECT_CUSTOMER = "SELECT * FROM customer ";
    private static final String UPDATE_USERS_SQL = "update customer set customer_type_id = ?,customer_name = ?, customer_birthday = ? , customer_gender = ? ,customer_id_card = ? ," +
            " customer_phone = ? , customer_email = ? , customer_address = ? , customer_code = ? where customer_id = ? ";
    private static final String DELETE_USERS_SQL = "delete from customer where customer_id = ? ";
    private static final String SELECT_USER_NAME= "SELECT * FROM customer where customer_name like ? ";

    DBConnection dtbase=new DBConnection();
    @Override
    public void insertCustomer(Customer customer) {
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        try {

            if (connection!=null){
                statement=connection.prepareStatement(INSERT_CUSTOMER);
                statement.setInt(1,customer.getCustomer_type_id());
                statement.setString(2,customer.getCustomer_name());
                statement.setString(3,customer.getCustomer_birthday());
                statement.setString(4,customer.getCustomer_gender());
                statement.setString(5,customer.getCustomer_id_card());
                statement.setString(6,customer.getCustomer_phone());
                statement.setString(7,customer.getCustomer_email());
                statement.setString(8,customer.getCustomer_address());
                statement.setString(9,customer.getCustomer_code());
                statement.executeUpdate();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                statement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
//            DBConnection.close();
        }
    }

    @Override
    public Customer selectCustomer(int id) {
        Customer customer=null;
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        ResultSet resultSet =null;
        if (connection!=null) {
            try {
                statement = connection.prepareStatement(SELECT_USER_BY_ID);
                statement.setInt(1, id);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    int type_id=resultSet.getInt("customer_type_id");
                    String name=resultSet.getString("customer_name");
                    String birthday=resultSet.getString("customer_birthday");
                    String gender=resultSet.getString("customer_gender");
                    String id_card=resultSet.getString("customer_id_card");
                    String phone=resultSet.getString("customer_phone");
                    String email=resultSet.getString("customer_email");
                    String address=resultSet.getString("customer_address");
                    String code=resultSet.getString("customer_code");
                    customer = new Customer(id,type_id,name,birthday,gender,id_card,phone,email,address,code);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customer;
    }

    @Override
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList=new ArrayList<>();
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        if (connection!=null){
            try {
                statement=connection.prepareStatement(SELECT_CUSTOMER);
                ResultSet resultSet=statement.executeQuery();
                while (resultSet.next()){
                    int id=resultSet.getInt("customer_id");
                    int type_id=resultSet.getInt("customer_type_id");
                    String name=resultSet.getString("customer_name");
                    String birthday=resultSet.getString("customer_birthday");
                    String gender=resultSet.getString("customer_gender");
                    String id_card=resultSet.getString("customer_id_card");
                    String phone=resultSet.getString("customer_phone");
                    String email=resultSet.getString("customer_email");
                    String address=resultSet.getString("customer_address");
                    String code=resultSet.getString("customer_code");
                    customerList.add(new Customer(id,type_id,name,birthday,gender,id_card,phone,email,address,code));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    statement.close();
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            }
        }
        return customerList;
    }

    @Override
    public boolean deleteCustomer(int id) {
        boolean rowDelete=false;
        Connection connection=dtbase.getConnection();
        PreparedStatement statement =null;
        try{
            try {
                statement=connection.prepareStatement(DELETE_USERS_SQL);
                statement.setInt(1,id);
                rowDelete=statement.executeLargeUpdate()>0;

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }finally {
            try {
                statement.close();
                connection.close();
            }catch (SQLException e){
                e.printStackTrace();
            }

        }
        return rowDelete;
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        boolean rowUpdate = false;
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        if (connection!=null) {
            try {
                try {
                    statement=connection.prepareStatement(UPDATE_USERS_SQL);
                    statement.setInt(1,customer.getCustomer_type_id());
                    statement.setString(2,customer.getCustomer_name());
                    statement.setString(3,customer.getCustomer_birthday());
                    statement.setString(4,customer.getCustomer_gender());
                    statement.setString(5,customer.getCustomer_id_card());
                    statement.setString(6,customer.getCustomer_phone());
                    statement.setString(7,customer.getCustomer_email());
                    statement.setString(8,customer.getCustomer_address());
                    statement.setString(9,customer.getCustomer_code());
                    statement.setInt(10,customer.getCustomer_id());
                    rowUpdate=statement.executeUpdate()>0;
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            }finally {
                try {
                    statement.close();
                    connection.close();
                }catch (SQLException e){
                    e.printStackTrace();
                }

            }
        }
        return rowUpdate;
    }

    @Override
    public List<Customer> searchName(String name) {
        List<Customer> customerList=new ArrayList<>();
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        if (connection!=null){
            try {
                statement=connection.prepareStatement(SELECT_USER_NAME);
                statement.setString(1,"%" + name + "%");
                ResultSet  resultSet=statement.executeQuery();
                while (resultSet.next()){
                    int id=resultSet.getInt("customer_id");
                    int type_id=resultSet.getInt("customer_type_id");
                    String customer_name=resultSet.getString("customer_name");
                    String birthday=resultSet.getString("customer_birthday");
                    String gender=resultSet.getString("customer_gender");
                    String id_card=resultSet.getString("customer_id_card");
                    String phone=resultSet.getString("customer_phone");
                    String email=resultSet.getString("customer_email");
                    String address=resultSet.getString("customer_address");
                    String code=resultSet.getString("customer_code");
                    customerList.add(new Customer(id,type_id,customer_name,birthday,gender,id_card,phone,email,address,code));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                try {
                    statement.close();
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            }
        }
        return customerList;
    }
}
