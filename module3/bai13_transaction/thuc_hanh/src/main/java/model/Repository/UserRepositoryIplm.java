package model.Repository;


import java.sql.*;

import model.bean.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryIplm implements UserRepository {
    private static final String SELECT_USER_BY_ID = "select id,`name`,email,country from users where id = ? ";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set `name` = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_USER= "SELECT * FROM users ";
    private static final String SELECT_USER_NAME= "SELECT * FROM users where country like ? ";
    private static final String SELECT_USER_SORT_NAME= "SELECT * FROM users ORDER BY `name` asc ";
    private static final String SELECT_USER_ID= "call fin_by_id(?) ";
    private static final String INSERT_USERS_STORE= "{CALL insert_user(?,?,?)} ";
    private static final String INSERT_USERS= "insert into users (`name`,email,country) VALUES(?,?,?) ";

    DBConnection dtbase=new DBConnection();
    @Override
    public void insertUser(User user) throws SQLException {
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        try {

            if (connection!=null){
                statement=connection.prepareStatement(INSERT_USERS);
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


//    thực hành tìm kiếm theo id
    @Override
    public List<User> searchId(int id) {
        List<User> userList=new ArrayList<>();
        Connection connection=dtbase.getConnection();
        CallableStatement statement=null;
        if (connection!=null){
            try {
                statement=connection.prepareCall(SELECT_USER_ID);
                statement.setInt(1,id);
                ResultSet  resultSet=statement.executeQuery();
                while (resultSet.next()){

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
// thực hành insert sử dụng storeProcedure
    @Override
    public void insertUserStore(User user) {
        Connection connection=dtbase.getConnection();
        CallableStatement statement=null;
        try {

            if (connection!=null){
                statement=connection.prepareCall(INSERT_USERS_STORE);
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
                connection.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        }
    }
//thực hành 2:sử dụng transaction
    @Override
    public void addUserTransaction(User user, int[] permision) {
        Connection connection=dtbase.getConnection();
        PreparedStatement statement =null;
        PreparedStatement assignment=null;
      ResultSet resultset=null;
        try {
            connection.setAutoCommit(false);
            statement=connection.prepareStatement(INSERT_USERS,Statement.RETURN_GENERATED_KEYS);
            statement.setString(1,user.getName());
            statement.setString(2,user.getEmail());
            statement.setString(3,user.getCountry());
            int rowAffected=statement.executeUpdate();
//            get user id
            resultset=  statement.getGeneratedKeys();
            int userId=0;
            if (resultset.next())
                userId=resultset.getInt(1);

            if (rowAffected==1){
//                assign permision to user
                String sqlPivot="INSERT INTO user_permision(user_id,permision_id) VALUES(?,?)";
                assignment=connection.prepareStatement(sqlPivot);
                for (int permisionId : permision ){
                    assignment.setInt(1,userId);
                    assignment.setInt(2,permisionId);
                    assignment.executeUpdate();
                }
                connection.commit();
            }else {
                connection.rollback();
            }

        } catch (SQLException e) {
            try{
                if (connection!=null){
                    connection.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        }finally {
            try{
                if (resultset!=null) resultset.close();
                if (statement!=null) statement.close();
                if (assignment!=null) assignment.close();
                if(connection!=null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}
