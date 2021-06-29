package model.repository;

import model.bean.Product;
import model.service.ProductService;
import model.service.ProductServicelmpl;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositorylmpl implements ProductRepository {
    ProductService productService=new ProductServicelmpl();
    @Override
    public List<Product> findAll() {
        return  new ArrayList<>(productService.findAll());
    }

    @Override
    public void save(Product product) {
        productService.save(product);
    }

    @Override
    public Product finById(int id) {
        return productService.finById(id);
    }

    @Override
    public void remove(int id) {
        productService.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {

        List<Product>  product=  productService.findByName(name);

        return  product;
    }
}
