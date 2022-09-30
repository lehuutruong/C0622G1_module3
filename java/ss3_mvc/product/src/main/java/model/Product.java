package model;

public class Product {
    private String id;
    private String name;
    private double price;
    private String productCompany;

    public Product() {
    }

    public Product(String id, String name, double price, String productCompany) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.productCompany = productCompany;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProductCompany() {
        return productCompany;
    }

    public void setProductCompany(String productCompany) {
        this.productCompany = productCompany;
    }
}
