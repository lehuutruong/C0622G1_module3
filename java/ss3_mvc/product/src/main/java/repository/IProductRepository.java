package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> showAll();

    Product findById(String id);

    void delete(String id);

    void update(String id, Product product);

    void add(Product product);
}
