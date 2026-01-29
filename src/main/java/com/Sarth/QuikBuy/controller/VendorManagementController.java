package com.Sarth.QuikBuy.controller;

import com.Sarth.QuikBuy.service.AdminServices;
import com.Sarth.QuikBuy.service.ProductServices;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class VendorManagementController {

    @Autowired
    private AdminServices adminService;
    @Autowired
    ProductServices productServices;

    // Mapping for the "Vendor Management" card click
    @GetMapping("/Adminvendors")
    public String showVendorPage(Model model) {
        model.addAttribute("vendors", adminService.findAllVendors());
        return "Admin_Vendor_detail";
    }

    // Mapping for the Action button
    @PostMapping("/admin/vendors/toggle-status/{id}")
    public String toggleVendor(@PathVariable Long id) {
        adminService.toggleVendorApproval(id);
        return "redirect:/Adminvendors";
    }


    @GetMapping("/admin/dashboard")
    public String showDashboard(HttpServletRequest req, Model model) {
        HttpSession session = req.getSession(false);

        // Security check: ensure admin is logged in
        if (session == null || session.getAttribute("user") == null) {
            return "redirect:/adminLogin";
        }

        // Fetch and add the data so it's never empty
        Map<String, Object> stats = adminService.getDashboardStats();
        model.addAllAttributes(stats);
        model.addAttribute("products", productServices.getAllProducts());

        return "adminDashboard";
    }
}