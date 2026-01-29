package com.Sarth.QuikBuy.controller;// src/main/java/com/Sarth/LeLo/controller/InventoryController.java

import com.Sarth.QuikBuy.service.AdminServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class InventoryController {

    @Autowired
    private AdminServices adminService;

    @GetMapping("/inventory")
    public String showInventoryPage(Model model) {
        model.addAttribute("inventoryItems", adminService.getInventoryDetails());
        return "admin_inventory_detail";
    }
}