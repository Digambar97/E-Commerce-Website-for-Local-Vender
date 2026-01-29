package com.Sarth.QuikBuy.controller;

import com.Sarth.QuikBuy.service.OrderService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PaymentController {

    @Autowired
    private OrderService orderService;

    // 1. Receives dynamic data from Checkout JSP and shows Payment JSP
    @PostMapping("/payment")
    public String handlePayment(
            @RequestParam Long productId,
            @RequestParam int quantity,
            @RequestParam String paymentMethod,
            HttpSession session) {
//
//        // TEMP USER (replace with logged-in user)
//        User user = new User();
//        user.setId(2L);
//
//        Order order = orderService.createOrder(
//                user,
//                productId,
//                quantity,
//                Payment.PaymentMethod.valueOf(paymentMethod)
//        );
//
//        session.setAttribute("orderId", order.getId());
        return "place-order";
    }
}