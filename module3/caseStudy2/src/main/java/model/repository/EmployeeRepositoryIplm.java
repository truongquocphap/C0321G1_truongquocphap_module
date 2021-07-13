package model.repository;

import model.bean.Customer;
import model.bean.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryIplm implements EmployeeRepository {
    private static final String SELECT_EMPLOYEE = "SELECT * FROM employee ";
    private static final String INSERT_CUSTOMER = "insert into employee (employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,position_id,education_degree_id,division_id,username)" +
            " VALUES(?,?,?,?,?,?,?,?,?,?,?) ";
    DBConnection dtbase=new DBConnection();
    @Override
    public void insertEmployee(Employee employee) {
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        try {

            if (connection!=null){
                statement=connection.prepareStatement(INSERT_CUSTOMER);
                statement.setString(1,employee.getEmployeeName());
                statement.setString(2,employee.getEmployeeBirthday());
                statement.setString(3,employee.getEmployeeIdCard());
                statement.setDouble(4,employee.getEmployeeSalary());
                statement.setString(5,employee.getEmployeePhone());
                statement.setString(6,employee.getEmployeeEmail());
                statement.setString(7,employee.getEmployeeAddress());
                statement.setInt(8,employee.getPositionId());
                statement.setInt(9,employee.getEducationDegreeId());
                statement.setInt(10,employee.getDivisionId());
                statement.setString(11,employee.getUsername());
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
    public List<Employee> selectAllEmployee() {
        List<Employee> employeeList=new ArrayList<>();
        Connection connection=dtbase.getConnection();
        PreparedStatement statement=null;
        if (connection!=null){
            try {
                statement=connection.prepareStatement(SELECT_EMPLOYEE);
                ResultSet resultSet=statement.executeQuery();
                while (resultSet.next()){
                    int employeeId = resultSet.getInt("employee_id");
                    String employeeName = resultSet.getString("employee_name");
                    String employeeBirthday = resultSet.getString("employee_birthday");
                    String employeeIdCard = resultSet.getString("employee_id_card");
                    double employeeSalary = resultSet.getDouble("employee_salary");
                    String employeePhone = resultSet.getString("employee_phone");
                    String employeeEmail = resultSet.getString("employee_email");
                    String employeeAddress = resultSet.getString("employee_address");
                    int positionId = resultSet.getInt("position_id");
                    int educationDegreeId = resultSet.getInt("education_degree_id");
                    int divisionId = resultSet.getInt("division_id");
                    String userName = resultSet.getString("username");
                    Employee employee= new Employee(employeeId, employeeName,employeeBirthday,employeeIdCard,employeeSalary,employeePhone,employeeEmail,employeeAddress,positionId,educationDegreeId,divisionId,userName);
                    employeeList.add(employee);
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
        return employeeList;
    }
}
