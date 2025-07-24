package com.example.productservice.model;

import jakarta.persistence.*;

@Entity
public class Product {
    @Id @GeneratedValue
    private Long id;

    private String name;
    private String description;

    // Getters and setters
}
