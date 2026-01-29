package com.Sarth.QuikBuy.service;

import com.Sarth.QuikBuy.model.Order;
import com.Sarth.QuikBuy.model.User;
import com.Sarth.QuikBuy.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepo;

    public Double getTotalRevenue() {
        return orderRepo.getTotalRevenue();
    }

    public Order processOrder(User user, double totalAmount, String transactionId) {
        Order order = new Order();
        order.setUser(user);
        order.setTotalAmount(totalAmount);

        // Map to Model Enums
        order.setOrderStatus(Order.OrderStatus.PLACED);

        // Mark as PAID if transaction ID is provided, else PENDING
        if (transactionId != null && !transactionId.isEmpty()) {
            order.setPaymentStatus(Order.PaymentStatus.PAID);
        } else {
            order.setPaymentStatus(Order.PaymentStatus.PENDING);
        }

        // JPA automatically fills 'id' and 'createdAt'
        return orderRepo.save(order);
    }
}