package model.repository;

import model.bean.Customer;
import model.bean.Employee;

import java.util.List;

public interface EmployeeRepository {
    public void insertEmployee(Employee employee);
    public List<Employee> selectAllEmployee();
}
