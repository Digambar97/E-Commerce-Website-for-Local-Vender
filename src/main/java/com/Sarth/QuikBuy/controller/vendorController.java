package com.Sarth.QuikBuy.controller;

import com.Sarth.QuikBuy.model.Product;
import com.Sarth.QuikBuy.model.User;
import com.Sarth.QuikBuy.model.Vendor;
import com.Sarth.QuikBuy.repository.VendorRepository;
import com.Sarth.QuikBuy.service.ProductServices;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
    public class vendorController {


    private final ProductServices productServices;
    private final  VendorRepository vendorRepository;

    public vendorController(ProductServices productServices, VendorRepository vendorRepository) {
        this.productServices = productServices;
        this.vendorRepository=vendorRepository;
    }


        @GetMapping("/vendorDashboard")
        public String vendorDashboard() {

        return "vendorDashboard"; // ✅ JSP file name
        }


    @GetMapping("/addProduct")
    public String addProduct() {
        return "addProduct"; // JSP file name
    }

    @GetMapping("/vendorProducts")
    public String vendorProducts(Model model, HttpSession session) {

        // 1️⃣ Get logged-in user from session
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            return "redirect:/login"; // safety
        }

        // 2️⃣ Find Vendor using user_id
        Vendor vendor = vendorRepository.findByUser(loggedInUser);

        // 3️⃣ Fetch products using vendor_id
        List<Product> products =
                productServices.getProductsByVendor(vendor.getId());

        // 4️⃣ Send to JSP
        model.addAttribute("products", products);

        return "vendorProducts";
    }



    @GetMapping("/vendorTotalProducts")
    public String vendorTotalProducts(Model model, HttpSession session) {

        // 1️⃣ Get logged-in user from session
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            return "redirect:/login";
        }

        // 2️⃣ Find Vendor
        Vendor vendor = vendorRepository.findByUser(loggedInUser);

        // 3️⃣ Count products
        int totalProducts =
                productServices.countProductsByVendor(vendor.getId());

        // 4️⃣ Send to JSP
        model.addAttribute("totalProducts", totalProducts);

        return "vendorTotalProducts";
    }


    @GetMapping("/vendorOrders")
    public String vendorOrders() {
        return "vendorOrders"; // JSP file name
    }


    @GetMapping("/vendorPayments")
    public String vendorPayments(Model model) {

        Long vendorId = 1L; // ✅ Replace with session vendor ID later

        // Placeholder values until DB logic is added
        model.addAttribute("totalEarnings", 0);
        model.addAttribute("pendingPayments", 0);
        model.addAttribute("completedPayments", 0);

        return "vendorPayments";
    }

    @PostMapping("/addNewProduct")
    public String saveProduct(
            Product product,
            @RequestParam("stock") int stock,
            @RequestParam("categoryId") Long categoryId,
            @RequestParam("imageUrl") String imageUrl,
            HttpSession session,
            Model model) {

        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            return "redirect:/login";
        }

        try {
            productServices.saveProduct(
                    product,
                    stock,
                    categoryId,
                    imageUrl,
                    loggedInUser
            );
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "addProduct";
        }

        return "redirect:/vendorDashboard";
    }






}

