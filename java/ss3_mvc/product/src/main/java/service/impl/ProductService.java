package service.impl;

import model.Product;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private static ProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> showAll() {
        return productRepository.showAll();
    }

    @Override
    public Product findById(String id) {
        return productRepository.findById(id);
    }

    @Override
    public void delete(String id) {
        productRepository.delete(id);
    }

    @Override
    public void update(String id, Product product) {
        productRepository.update(id, product);
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }
}
