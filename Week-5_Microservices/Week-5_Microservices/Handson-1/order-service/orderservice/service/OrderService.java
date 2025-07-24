package com.example.orderservice.service;

import com.example.orderservice.feign.UserClient;
import com.example.orderservice.model.Order;
import com.example.orderservice.model.User;
import com.example.orderservice.repository.OrderRepository;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final UserClient userClient;

    public OrderService(OrderRepository orderRepository, UserClient userClient) {
        this.orderRepository = orderRepository;
        this.userClient = userClient;
    }

    public Order placeOrder(Order order) {
        User user = userClient.getUser(order.getUserId());
        if (user == null) throw new RuntimeException("User not found");
        return orderRepository.save(order);
    }
}
