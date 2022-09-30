package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> showAll();

    Product findById(String id);

    void delete(String id);

    void update(String id, Product product);

    void add(Product product);
}
