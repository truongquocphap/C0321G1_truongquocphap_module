package model.service;

import model.bean.Employee;

import java.util.List;
import java.util.Map;

public interface EmployeeService {
    public Map<String,String> insertEmployee(Employee employee);
    public List<Employee> selectAllEmployee();
}
