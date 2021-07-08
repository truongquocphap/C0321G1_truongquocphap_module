package model.repository;

import model.bean.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements ServiceRepository {
    private static final String SELECT_SERVICE_BY_ID = "select service_id,service_name,service_area,service_cost,service_max_people,rent_type_id,service_type_id,strandard_room,description_other_convenience,pool_area ,number_of_floor,service_code  from service where service_id = ? ";
    private static final String INSERT_SERVICE = "insert into service (service_name,service_area,service_cost,service_max_people,rent_type_id,service_type_id,strandard_room,description_other_convenience,pool_area ,number_of_floor,service_code )" +
            " VALUES(?,?,?,?,?,?,?,?,?,?,?) ";
    private static final String SELECT_SERVICE = "SELECT * FROM service ";
    private static final String UPDATE_SERVICE_SQL = "update service set service_name = ?,service_area = ?, service_cost = ? , service_max_people = ? ,rent_type_id = ? , service_type_id = ?, strandard_room = ? ," +
            " description_other_convenience = ? , pool_area = ? , number_of_floor = ? , service_code = ? where service_id = ? ";
    private static final String DELETE_SERVICE_SQL = "delete from service where service_id = ? ";
    private static final String SELECT_SERVICE_NAME = "SELECT * FROM service where service_name like ? ";
    DBConnection dtbase=new DBConnection();
    @Override
    public void insertService(Service service) {
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        try {

            if (connection!=null){
                statement=connection.prepareStatement(INSERT_SERVICE);
                statement.setString(1,service.getService_name());
                statement.setInt(2,service.getService_area());
                statement.setDouble(3,service.getService_cost());
                statement.setInt(4,service.getService_max_people());
                statement.setInt(5,service.getRent_type_id());
                statement.setInt(6,service.getService_type_id());
                statement.setString(7,service.getStrandard_room());
                statement.setString(8,service.getDescription_other_convenience());
                statement.setDouble(9,service.getPool_area());
                statement.setInt(10,service.getNumber_of_floor());
                statement.setString(11,service.getDescription_other_convenience());

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
    public Service selectService(int id) {
        Service service=null;
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        ResultSet resultSet =null;
        if (connection!=null) {
            try {
                statement = connection.prepareStatement(SELECT_SERVICE_BY_ID);
                statement.setInt(1, id);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    String name=resultSet.getString("service_name");
                    int area=resultSet.getInt("service_area");
                    Double cost=resultSet.getDouble("service_cost");
                    int people=resultSet.getInt("service_max_people");
                    int  rent_type_id=resultSet.getInt("rent_type_id");
                    int  service_type_id=resultSet.getInt("service_type_id");
                    String room=resultSet.getString("strandard_room");
                    String description_other_convenience=resultSet.getString("description_other_convenience");
                    Double pool_area=resultSet.getDouble("pool_area");
                    int  number_of_floor=resultSet.getInt("number_of_floor");
                    String service_code=resultSet.getString("service_code");
                    service = new Service(id,name,area,cost,people,rent_type_id,service_type_id,room,description_other_convenience,pool_area,number_of_floor,service_code);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return service;
    }

    @Override
    public List<Service> selectAllService() {
        List<Service> serviceList=new ArrayList<>();
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        if (connection!=null){
            try {
                statement=connection.prepareStatement(SELECT_SERVICE);
                ResultSet resultSet=statement.executeQuery();
                while (resultSet.next()){
                    int service_id=resultSet.getInt("service_id");
                    String name=resultSet.getString("service_name");
                    int area=resultSet.getInt("service_area");
                    Double cost=resultSet.getDouble("service_cost");
                    int people=resultSet.getInt("service_max_people");
                    int  rent_type_id=resultSet.getInt("rent_type_id");
                    int  service_type_id=resultSet.getInt("service_type_id");
                    String room=resultSet.getString("strandard_room");
                    String description_other_convenience=resultSet.getString("description_other_convenience");
                    Double pool_area=resultSet.getDouble("pool_area");
                    int  number_of_floor=resultSet.getInt("number_of_floor");
                    String service_code=resultSet.getString("service_code");
                    serviceList.add( new Service(service_id,name,area,cost,people,rent_type_id,service_type_id,room,description_other_convenience,pool_area,number_of_floor,service_code));
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
        return serviceList;
    }

    @Override
    public boolean deleteService(int id) {
        boolean rowDelete=false;
        Connection connection=dtbase.getConnection();
        PreparedStatement statement =null;
        try{
            try {
                statement=connection.prepareStatement(DELETE_SERVICE_SQL);
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
    public boolean updateService(Service service) {
        boolean rowUpdate = false;
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        if (connection!=null) {
            try {
                try {
                    statement=connection.prepareStatement(UPDATE_SERVICE_SQL);
                    statement.setString(1,service.getService_name());
                    statement.setInt(2,service.getService_area());
                    statement.setDouble(3,service.getService_cost());
                    statement.setInt(4,service.getService_max_people());
                    statement.setInt(5,service.getRent_type_id());
                    statement.setInt(6,service.getService_type_id());
                    statement.setString(7,service.getStrandard_room());
                    statement.setString(8,service.getDescription_other_convenience());
                    statement.setDouble(9,service.getPool_area());
                    statement.setInt(10,service.getNumber_of_floor());
                    statement.setString(11,service.getDescription_other_convenience());
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
    public List<Service> searchName(String name) {
        List<Service> serviceList=new ArrayList<>();
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        if (connection!=null){
            try {
                statement=connection.prepareStatement(SELECT_SERVICE_NAME);
                statement.setString(1,"%" + name + "%");
                ResultSet  resultSet=statement.executeQuery();
                while (resultSet.next()){
                    int service_id=resultSet.getInt("service_id");
                    String service_name=resultSet.getString("service_name");
                    int area=resultSet.getInt("service_area");
                    Double cost=resultSet.getDouble("service_cost");
                    int people=resultSet.getInt("service_max_people");
                    int  rent_type_id=resultSet.getInt("rent_type_id");
                    int  service_type_id=resultSet.getInt("service_type_id");
                    String room=resultSet.getString("strandard_room");
                    String description_other_convenience=resultSet.getString("description_other_convenience");
                    Double pool_area=resultSet.getDouble("pool_area");
                    int  number_of_floor=resultSet.getInt("number_of_floor");
                    String service_code=resultSet.getString("service_code");
                    serviceList.add( new Service(service_id,service_name,area,cost,people,rent_type_id,service_type_id,room,description_other_convenience,pool_area,number_of_floor,service_code));
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
        return serviceList;
    }
}
