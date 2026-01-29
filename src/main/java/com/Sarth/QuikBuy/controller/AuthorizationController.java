package com.Sarth.QuikBuy.controller;

import com.Sarth.QuikBuy.model.User;
import com.Sarth.QuikBuy.repository.ProductRepository;
import com.Sarth.QuikBuy.repository.UserRepository;
import com.Sarth.QuikBuy.repository.VendorRepository;
import com.Sarth.QuikBuy.service.AdminServices;
import com.Sarth.QuikBuy.service.ProductServices;
import com.Sarth.QuikBuy.service.UserServices;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.Sarth.QuikBuy.service.VendorServices;
import com.Sarth.QuikBuy.model.Vendor;

import java.util.Map;

@Controller
public class AuthorizationController {

    ProductServices productServices;
    ProductRepository repo;
    UserServices userServices;
    UserRepository userRepository;
    private final VendorServices vendorServices;
    private final VendorRepository vendorRepository;
    @Autowired
    AdminServices adminServices;

    @Autowired
    public AuthorizationController(ProductRepository repo, ProductServices productServices, UserServices userServices, UserRepository userRepository,VendorServices vendorServices, VendorRepository vendorRepository) {
        this.repo = repo;
        this.productServices = productServices;
        this.userServices = userServices;
        this.userRepository = userRepository;
        this.vendorServices=vendorServices;
        this.vendorRepository=vendorRepository;
    }


// AuthorizationController.java

    @PostMapping("/auth/login")
    public String loginAuth(@RequestParam("password") String pass,
                            @RequestParam("username") String uname,
                            Model model, HttpServletRequest req) {

        // 1. Fetch the user first to check existence and status
        User user = userRepository.findByUsernameAndRole(uname, User.Role.CUSTOMER);

        if (user != null && user.getPassword().equals(pass)) {

            // 2. CHECK BLOCK STATUS
            if (user.getStatus() == User.Status.BLOCKED || !user.isActive()) {
                model.addAttribute("error", "Your account has been blocked. Please contact admin.");
                return "login";
            }

            // 3. SUCCESSFUL LOGIN
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            return "redirect:/";
        }
        else {
            // 4. INVALID CREDENTIALS
            model.addAttribute("error", "Invalid Username or Password. Please try again.");
            return "login";
        }
    }







    @PostMapping("/adminAuth")
    public  String login(@RequestParam ("username") String uname,@RequestParam ("password") String pass,Model model, HttpServletRequest req){
        User user = adminServices.vaildateAdmin(uname,pass);
        if(user !=null){
            HttpSession session = req.getSession();
            session.setAttribute("user",user);

// Fetch Stats
            Map<String, Object> stats = adminServices.getDashboardStats();
            model.addAllAttributes(stats);

            // Also show products list if needed
            model.addAttribute("products", productServices.getAllProducts());
            return "adminDashboard";

        }
        else {
            // IMPORTANT: Add the error and return the string "login"
            // This keeps the 'error' object available for the JSP
            model.addAttribute("error", "Invalid Username or Password. Please try again.");
            return "adminLogin";
        }

    }





    @PostMapping("/vendorAuth")
    public String vendorAuth(@RequestParam String username,
                             @RequestParam String password,
                             HttpSession session,
                             Model model) {
        try {
            // 1️⃣ Authenticate vendor
            Vendor vendor = vendorServices.authenticateVendor(username, password);

            if (vendor == null) {
                model.addAttribute("error", "Invalid Vendor Username or Password");
                return "vendorLogin";
            }

            // 2️⃣ Store in session
            session.setAttribute("user", vendor.getUser());
            session.setAttribute("vendorId", vendor.getId());

            return "redirect:/vendorDashboard";

        } catch (RuntimeException e) {
            // 3️⃣ Handle the "Blocked" scenario specifically
            if ("V_BLOCKED".equals(e.getMessage())) {
                model.addAttribute("error", "Your vendor account is blocked. Please contact Admin.");
            } else {
                model.addAttribute("error", "An error occurred. Please try again.");
            }
            return "vendorLogin";
        }
    }










    @GetMapping("/logout12")
    public String logout(HttpSession session) {
        session.invalidate(); // Destroy the session
        return "redirect:/";
    }
}
