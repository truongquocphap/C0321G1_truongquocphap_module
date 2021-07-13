package model.service;

import model.bean.Employee;
import model.repository.EmployeeRepository;
import model.repository.EmployeeRepositoryIplm;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeServiceIplm implements EmployeeService {
    EmployeeRepository employeeRepository=new EmployeeRepositoryIplm();
    @Override
    public Map<String,String> insertEmployee(Employee employee) {

        Map<String,String> map=new HashMap<>();
        if (Validate.validateName(employee.getEmployeeName())!=null
                || Validate.validateDate(employee.getEmployeeBirthday())!=null
                || Validate.validateEmail(employee.getEmployeeEmail())!=null
                || Validate.validateIdCard(employee.getEmployeeIdCard())!=null
                || Validate.validateTelephone(employee.getEmployeePhone())!=null
                || Validate.validateNumber2(String.valueOf(employee.getEmployeeSalary()))!=null
        ){
            map.put("name",Validate.validateName(employee.getEmployeeName()));
            map.put("birthday",Validate.validateDate(employee.getEmployeeBirthday()));
            map.put("email",Validate.validateEmail(employee.getEmployeeEmail()));
            map.put("idCard",Validate.validateIdCard(employee.getEmployeeIdCard()));
            map.put("phone",Validate.validateTelephone(employee.getEmployeePhone()));
            map.put("salary",Validate.validateNumber2(String.valueOf(employee.getEmployeeSalary())));
        }else {
            employeeRepository.insertEmployee(employee);
        }
        return map;
    }

    @Override
    public List<Employee> selectAllEmployee() {
        return employeeRepository.selectAllEmployee();
    }
}
