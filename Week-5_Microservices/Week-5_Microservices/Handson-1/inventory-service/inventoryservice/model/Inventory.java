package com.example.inventoryservice.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Inventory {
    @Id
    private Long productId;
    private int quantity;

