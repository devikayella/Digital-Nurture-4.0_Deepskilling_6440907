package com.example.inventoryservice.service;

import com.example.inventoryservice.model.Inventory;
import com.example.inventoryservice.repository.InventoryRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InventoryService {
    private final InventoryRepository repository;

    public InventoryService(InventoryRepository repository) {
        this.repository = repository;
    }

    public Inventory save(Inventory inventory) {
        return repository.save(inventory);
    }

    public List<Inventory> getAll() {
        return repository.findAll();
    }

    public Inventory getByProductId(Long productId) {
        return repository.findById(productId).orElse(null);
    }

    public void deleteByProductId(Long productId) {
        repository.deleteById(productId);
    }
}
