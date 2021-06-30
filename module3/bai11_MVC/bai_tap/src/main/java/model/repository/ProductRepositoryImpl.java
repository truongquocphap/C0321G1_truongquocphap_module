package model.repository;

import model.bean.Product;

import java.util.*;

public class ProductRepositoryImpl implements ProductRepository {
    private static Map<Integer,Product> productList;
    static {
        productList=new HashMap<>();
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
Product product=null;
        List<Product> listProduct = new ArrayList<>();
        Set<Integer> set=productList.keySet();
        for (Integer key:set) {
            if (productList.get(key).getName().equals(name)){
                product=productList.get(key);
                listProduct.add(product);
            }
        }
        return  listProduct;
    }
    
}
