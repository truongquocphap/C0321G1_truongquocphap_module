package model.service;

import model.bean.Customer;
import model.repository.CustomerRepository;
import model.repository.CustomerRepositoryImpl;

import java.util.List;

public class CustomerSeviceImpl implements CustomerService {
    CustomerRepository customerRepository =new CustomerRepositoryImpl();
    @Override
    public void insertCustomer(Customer customer) {
    customerRepository.insertCustomer(customer);
    }

    @Override
    public Customer selectCustomer(int id) {
        return customerRepository.selectCustomer(id);
    }

    @Override
    public List<Customer> selectAllCustomer() {
        return customerRepository.selectAllCustomer();
    }

    @Override
    public boolean deleteCustomer(int id) {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return customerRepository.updateCustomer(customer);
    }

    @Override
    public List<Customer> searchName(String name) {
        return customerRepository.searchName(name);
    }
}
