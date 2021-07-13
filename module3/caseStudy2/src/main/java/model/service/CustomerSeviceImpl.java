package model.service;

import model.bean.Customer;
import model.repository.CustomerRepository;
import model.repository.CustomerRepositoryImpl;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerSeviceImpl implements CustomerService {
    CustomerRepository customerRepository =new CustomerRepositoryImpl();
    @Override
    public Map<String ,String> insertCustomer(Customer customer) {

    Map<String,String> map=new HashMap<>();
    if (Validate.validateName(customer.getCustomer_name())!=null
    || Validate.validateDate(customer.getCustomer_birthday())!=null
    || Validate.validateCustomerCode(customer.getCustomer_code())!=null
    || Validate.validateEmail(customer.getCustomer_email())!=null
    || Validate.validateIdCard(customer.getCustomer_id_card())!=null
    || Validate.validateTelephone(customer.getCustomer_phone())!=null
        ){
        map.put("name",Validate.validateName(customer.getCustomer_name()));
        map.put("birthday",Validate.validateDate(customer.getCustomer_birthday()));
        map.put("code",Validate.validateCustomerCode(customer.getCustomer_code()));
        map.put("email",Validate.validateEmail(customer.getCustomer_email()));
        map.put("idCard",Validate.validateIdCard(customer.getCustomer_id_card()));
        map.put("phone",Validate.validateTelephone(customer.getCustomer_phone()));
    }else {
        customerRepository.insertCustomer(customer);
    }
    return map;
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
    public Map<String ,String>  updateCustomer(Customer customer) {
        Map<String,String> map=new HashMap<>();
        if (Validate.validateName(customer.getCustomer_name())!=null
                || Validate.validateDate(customer.getCustomer_birthday())!=null
                || Validate.validateCustomerCode(customer.getCustomer_code())!=null
                || Validate.validateEmail(customer.getCustomer_email())!=null
                || Validate.validateIdCard(customer.getCustomer_id_card())!=null
                || Validate.validateTelephone(customer.getCustomer_phone())!=null
        ){
            map.put("name",Validate.validateName(customer.getCustomer_name()));
            map.put("birthday",Validate.validateDate(customer.getCustomer_birthday()));
            map.put("code",Validate.validateCustomerCode(customer.getCustomer_code()));
            map.put("email",Validate.validateEmail(customer.getCustomer_email()));
            map.put("idCard",Validate.validateIdCard(customer.getCustomer_id_card()));
            map.put("phone",Validate.validateTelephone(customer.getCustomer_phone()));
        }else {
            customerRepository.updateCustomer(customer);
        }
        return map;
    }

    @Override
    public List<Customer> searchName(String name) {
        return customerRepository.searchName(name);
    }
}
