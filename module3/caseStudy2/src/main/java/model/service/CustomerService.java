package model.service;

import model.bean.Customer;

import java.util.List;
import java.util.Map;

public interface CustomerService {
    public Map<String,String> insertCustomer(Customer customer);
    public Customer selectCustomer(int id);
    public List<Customer> selectAllCustomer();
    public boolean deleteCustomer(int id);
    public Map<String ,String> updateCustomer(Customer customer);
    public List<Customer> searchName(String name);
}
