package model.service;

import model.bean.Customer;

import java.util.List;

public interface CustomerService {
    public void insertCustomer(Customer customer);
    public Customer selectCustomer(int id);
    public List<Customer> selectAllCustomer();
    public boolean deleteCustomer(int id);
    public boolean updateCustomer(Customer customer);
    public List<Customer> searchName(String name);
}
