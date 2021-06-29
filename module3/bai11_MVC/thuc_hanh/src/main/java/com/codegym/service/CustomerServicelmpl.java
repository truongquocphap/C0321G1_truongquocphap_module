package com.codegym.service;

import com.codegym.model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServicelmpl implements CustomerService{
    private static Map<Integer,Customer> customers;
    static {
        customers =new HashMap<>();
        customers.put(1,new Customer(1,"Papa","abc@gmail.com","Quang Ngai"));
        customers.put(2,new Customer(2,"Sushi","abcd@gmail.com","Quang Ngai"));
        customers.put(3,new Customer(3,"Takura","abce@gmail.com","Quang Ngai"));
        customers.put(4,new Customer(4,"Momo","abcf@gmail.com","Quang Ngai"));
        customers.put(5,new Customer(5,"azuke","abcg@gmail.com","Quang Ngai"));
    }
    @Override
    public List<Customer> finAll() {
        return new ArrayList<>(customers.values());
    }

    @Override
    public void save(Customer customer) {
    customers.put(customer.getId(),customer);
    }

    @Override
    public Customer finById(int id) {
        return customers.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
customers.put(id,customer);
    }

    @Override
    public void remove(int id) {
        customers.remove(id);
    }
}
