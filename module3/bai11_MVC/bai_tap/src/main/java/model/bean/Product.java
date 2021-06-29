package model.bean;

public class Product {
    private int id;
    private String name;
    private String codeProduct;
    private String producer;

    public Product() {
    }

    public Product(int id, String name, String codeProduct, String producer) {
        this.id = id;
        this.name = name;
        this.codeProduct = codeProduct;
        this.producer = producer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCodeProduct() {
        return codeProduct;
    }

    public void setCodeProduct(String codeProduct) {
        this.codeProduct = codeProduct;
    }

    public String getProducer() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }
}
