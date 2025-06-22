package InventoryManagementSystem;

import java.util.HashMap;
class InventoryManager {
    private HashMap<Integer, Product> inventory = new HashMap<>();

    void addProduct(Product p) {
        inventory.put(p.productId, p);
    }

    void updateProduct(Product p) {
        inventory.put(p.productId, p);
    }

    void deleteProduct(int id) {
        inventory.remove(id);
    }

    void showInventory() {
        for (Product p : inventory.values()) {
            System.out.println(p);
        }
    }

    public static void main(String[] args) {
        InventoryManager manager = new InventoryManager();
        manager.addProduct(new Product(101, "Mouse", 20, 499.0));
        manager.addProduct(new Product(102, "Keyboard", 10, 899.0));
        manager.updateProduct(new Product(101, "Mouse", 25, 499.0));
        manager.deleteProduct(102);
        manager.showInventory();
    }
}