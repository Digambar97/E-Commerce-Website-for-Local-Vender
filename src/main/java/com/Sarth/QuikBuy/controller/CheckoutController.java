package com.Sarth.QuikBuy.controller;

import com.Sarth.QuikBuy.model.Order;
import com.Sarth.QuikBuy.model.User;
import com.Sarth.QuikBuy.service.OrderService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

@Controller
public class CheckoutController {

    @Autowired
    private OrderService orderService;

    @PostMapping("/confirmOrder")
    public String confirmOrder(@RequestParam("transactionId") String txId,
                               HttpSession session,
                               Model model) {

        User user = (User) session.getAttribute("user");
        Double total = (Double) session.getAttribute("totalAmount");

        if (user == null) {
            return "redirect:/loginpage";
        }

        // Save order to DB
        Order savedOrder = orderService.processOrder(user, total, txId);

        // Clear the cart from session after successful placement
        session.removeAttribute("cartItems");
        session.removeAttribute("totalAmount");

        model.addAttribute("order", savedOrder);
        return "order-success"; // This will be your next JSP page
    }
}