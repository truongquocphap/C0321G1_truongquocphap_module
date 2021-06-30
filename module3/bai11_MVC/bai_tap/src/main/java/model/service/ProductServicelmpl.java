
package model.service;

        import model.bean.Product;
        import model.repository.ProductRepository;
        import model.repository.ProductRepositoryImpl;

        import java.util.ArrayList;
        import java.util.List;
        import java.util.Map;

public class ProductServicelmpl implements ProductService {
    private ProductRepository productRepository=new ProductRepositoryImpl();
    @Override
    public List<Product> findAll() {
        return  productRepository.findAll();
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    public Product finById(int id) {
        return productRepository.finById(id);
    }

    @Override
    public void remove(int id) {
        productRepository.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {

        return   productRepository.findByName(name);
    }
}

