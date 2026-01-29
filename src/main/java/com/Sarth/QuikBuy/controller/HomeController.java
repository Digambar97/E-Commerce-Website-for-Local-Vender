package com.Sarth.QuikBuy.controller;

import com.Sarth.QuikBuy.model.CartItem;
import com.Sarth.QuikBuy.model.Product;
import com.Sarth.QuikBuy.repository.ProductRepository;
import com.Sarth.QuikBuy.service.ProductServices;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.*;

@Controller
public class HomeController {

    ProductServices productServices;
    ProductRepository repo;



    @Autowired
    public HomeController(ProductServices productServices,
                          ProductRepository repo) {
        this.productServices = productServices;
        this.repo = repo;
    }

    HomeController(ProductServices productServices){
        this.productServices=productServices;
    }

    @GetMapping("/")
    public String home(Model model){
        model.addAttribute("products",productServices.getAllProducts());

        return "index";
    }

    @PostMapping("/buynow")
    public String buynow(@RequestParam("pid") long p,
                         @RequestParam("quantity") String q,
                         Model model) {

        // 1. Fetch product from DB to ensure all fields (price, name) are loaded
        Product product = repo.findById(p).orElseThrow(() -> new RuntimeException("Product not found"));

        // 2. Add product object to the model
        model.addAttribute("product", product);

        // 3. Parse quantity safely
        try {
            int q1 = Integer.parseInt(q);
            model.addAttribute("quantity", q1);
        } catch (NumberFormatException e) {
            model.addAttribute("quantity", 1);
        }

        return "buynow"; // Refers to WEB-INF/views/buynow.jsp
    }
    @PostMapping("/addcart")
    public String addcart(HttpSession session,
                          @RequestParam("pid") long pid,
                          @RequestParam("quantity") int quantity) {
        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        Product product = repo.findById(pid).orElseThrow();
        boolean found = false;
        for (CartItem item : cart) {
            if (item.getProduct().getId().equals(pid)) {
                item.setQuantity(item.getQuantity() + quantity);
                found = true;
                break;
            }
        }
        if (!found) {
            CartItem cartItem = new CartItem(product, quantity);
            cart.add(cartItem);
        }

        session.setAttribute("cart", cart);

        return "redirect:/cart";
    }
    @GetMapping("/cart")
    public String viewCart(HttpSession session, Model model) {

        List<CartItem> cart =
                (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        double total = cart.stream()
                .mapToDouble(i -> i.getProduct().getPrice() * i.getQuantity())
                .sum();

        model.addAttribute("cartItems", cart);
        model.addAttribute("cartTotal", total);

        return "cart"; // cart.jsp
    }



}
