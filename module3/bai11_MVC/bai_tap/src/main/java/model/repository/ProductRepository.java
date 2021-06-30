package model.repository;

import model.bean.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findAll();
    void save(Product product);
    Product finById(int id);
    void remove(int id);
   List<Product>  findByName(String name);
//   void edit(int id,String name,String codeProduct,String producer);

}
