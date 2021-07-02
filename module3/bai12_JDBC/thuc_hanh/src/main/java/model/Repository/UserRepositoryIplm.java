package model.Repository;

import model.bean.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryIplm implements UserRepository {
    private static final String SELECT_USER_BY_ID = "select id,`name`,email,country from users where id = ? ";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set `name` = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_USER= "SELECT * FROM users ";
    private static final String SELECT_USER_NAME= "SELECT * FROM users where country like ? ";
    private static final String SELECT_USER_SORT_NAME= "SELECT * FROM users ORDER BY `name` asc ";

    DBConnection dtbase=new DBConnection();
    @Override
    public void insertUser(User user) throws SQLException {
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        try {

            if (connection!=null){
                statement=connection.prepareStatement("insert into users (`name`,email,country) VALUES(?,?,?)");
                statement.setString(1,user.getName());
                statement.setString(2,user.getEmail());
                statement.setString(3,user.getCountry());
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
    public User selectUser(int id) {
        User user=null;
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        ResultSet resultSet =null;
        if (connection!=null) {
            try {
                statement = connection.prepareStatement(SELECT_USER_BY_ID);
                statement.setInt(1, id);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    user = new User(id, name, email, country);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user;
    }

    @Override
    public List<User> selectAllUser() {
        List<User> userList=new ArrayList<>();
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        if (connection!=null){
            try {
                statement=connection.prepareStatement(SELECT_USER);
                ResultSet  resultSet=statement.executeQuery();
                while (resultSet.next()){
                    int id=resultSet.getInt("id");
                    String name=resultSet.getString("name");
                    String email=resultSet.getString("email");
                    String country=resultSet.getString("country");
                    userList.add(new User(id,name,email,country));
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
        return userList;
    }

    @Override
    public boolean deleteUser(int id)  {
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
    public boolean updateUser(User user)  {
        boolean rowUpdate = false;
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        if (connection!=null) {
            try {
                try {
                    statement=connection.prepareStatement(UPDATE_USERS_SQL);
                    statement.setString(1,user.getName());
                    statement.setString(2,user.getEmail());
                    statement.setString(3,user.getCountry());
                    statement.setInt(4,user.getId());
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
    public List<User> search(String country) {
        List<User> userList=new ArrayList<>();
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        if (connection!=null){
            try {
                statement=connection.prepareStatement(SELECT_USER_NAME);
                statement.setString(1,"%" + country + "%");
                ResultSet  resultSet=statement.executeQuery();
                while (resultSet.next()){
                    int id=resultSet.getInt("id");
                    String name=resultSet.getString("name");
                    String email=resultSet.getString("email");
                    String countrys=resultSet.getString("country");
                    userList.add(new User(id,name,email,countrys));
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
        return userList;
    }

    @Override
    public List<User> sortName() {
        List<User> userList=new ArrayList<>();
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        if (connection!=null){
            try {
                statement=connection.prepareStatement(SELECT_USER_SORT_NAME);
                ResultSet  resultSet=statement.executeQuery();
                while (resultSet.next()){
                    int id=resultSet.getInt("id");
                    String name=resultSet.getString("name");
                    String email=resultSet.getString("email");
                    String countrys=resultSet.getString("country");
                    userList.add(new User(id,name,email,countrys));
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
        return userList;
    }
}
