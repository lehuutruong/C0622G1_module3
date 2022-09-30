package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product("a1", "Cake", 15, "Da Nang"));
        productList.add(new Product("a2", "Shirt", 17, "HA Noi"));
        productList.add(new Product("a3", "Book", 19, "Quang Binh"));
        productList.add(new Product("a4", "Computer", 21, "Ha Tinh"));
        productList.add(new Product("a5", "Phone", 23, "CON TUM"));

    }

    @Override
    public List<Product> showAll() {
        return productList;
    }

    @Override
    public Product findById(String id) {
        for (Product item : productList
        ) {
            if (item.getId().equals(id)) {
                return item;
            }
        }
        return null;
    }

    @Override
    public void delete(String id) {
        for (Product item : productList) {
            if (item.getId().equals(id)) {
                productList.remove(item);
            }
        }
    }

    @Override
    public void update(String id, Product product) {
        List<Product> products = new ArrayList<>();
        for (Product item : productList
        ) {
            if (item.getId().equals(id)) {
                products.add(item);
            }
        }
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }
}
