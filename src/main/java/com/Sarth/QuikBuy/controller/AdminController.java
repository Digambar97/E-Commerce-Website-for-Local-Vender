package com.Sarth.QuikBuy.controller;

import com.Sarth.QuikBuy.service.AdminServices;
import com.Sarth.QuikBuy.service.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
    @Autowired
    ProductServices productServices;
    AdminServices adminServices;

    @Autowired
    public AdminController(AdminServices adminServices){
        this.adminServices=adminServices;
    }



    @GetMapping("/admin/users")
    public String admin_user(Model model){
        model.addAttribute("users",adminServices.getAllUsers());
        return "admin-users";
    }

    // src/main/java/com/Sarth/LeLo/controller/AdminController.java

    @PostMapping("/admin/blockUser")
    public String blockUser(@RequestParam("userId") Long userId) {
        // Call the service to update the database
        adminServices.blockUser(userId);

        // Redirect back to the user management page to see the updated status
        return "redirect:/admin/users";
    }

    @PostMapping("/admin/unblockUser")
    public String unblockUser(@RequestParam("userId") Long userId) {
        adminServices.unblockUser(userId);
        return "redirect:/admin/users";
    }

}
