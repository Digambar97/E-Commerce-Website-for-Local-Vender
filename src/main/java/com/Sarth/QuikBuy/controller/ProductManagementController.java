package com.Sarth.QuikBuy.controller;

import com.Sarth.QuikBuy.service.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class ProductManagementController {

    @Autowired
    private ProductServices productServices;

    // Mapping for the "Product Management" card click from Dashboard
    @GetMapping("/products")
    public String showProductPage(Model model) {
        // Fetch all products to display in the table
        model.addAttribute("products", productServices.getAllProducts());
        return "admin_product_detail";
    }

    // Handles the Delete button click
    @PostMapping("/products/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productServices.deleteProduct(id);
        // Standard SDLC Practice: Redirect to refresh the list and prevent resubmission
        return "redirect:/admin/products";
    }
}