package model.service;

import model.bean.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProductServicelmpl implements ProductService {
    public static Map<Integer,Product> productList;
    static {
        productList.put(1,new Product(1,"xe hoi","0001","japan"));
        productList.put(2,new Product(2,"xe may","0002","japan"));
        productList.put(3,new Product(3,"xepppp","0003","japan"));
        productList.put(4,new Product(4,"xe tai","0004","japan"));
        productList.put(5,new Product(5,"xe cop","0005","japan"));
    }
    @Override
    public List<Product> findAll() {
        return  new ArrayList<>(productList.values());
    }

    @Override
    public void save(Product product) {
        productList.put(product.getId(),product);
    }

    @Override
    public Product finById(int id) {
        return productList.get(id);
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {

              List<Product>  product= (List<Product>) productList.values();
              List<Product> productList = null;
        for (int i = 0; i < product.size(); i++) {
            if (product.get(i).getName().equals(name)){
                productList.add(product.get(i));
            }

        }
        return  productList;
    }
}
