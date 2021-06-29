package model.service;

import model.bean.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    void save(Product product);
    Product finById(int id);
    void remove(int id);
    List<Product> findByName(String name);

}
