package com.Sarth.QuikBuy.controller;

import com.Sarth.QuikBuy.service.AdminServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class OrderManagementController {

    @Autowired
    private AdminServices adminService;

    @GetMapping("/orders")
    public String showOrderPage(Model model) {
        model.addAttribute("orders", adminService.getAllOrders());
        return "admin_order_detail";
    }
}