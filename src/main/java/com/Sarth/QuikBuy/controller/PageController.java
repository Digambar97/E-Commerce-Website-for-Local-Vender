package com.Sarth.QuikBuy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PageController {
    @PostMapping("/confirmOrder1")
    public String userprofilr(){
        return "success";
    }
    @PostMapping("/l")
    public  String login1(){
        return "place-order";
    }

    @PostMapping("/loginpage")
    public  String login(){
        return "login";
    }

    @GetMapping("/register")
    public String register(){
        return  "register";
    }

    @GetMapping("/adminLogin")
    public String admin(){
        return "adminLogin";
    }

//    @GetMapping("/adminDashBoard" )
//    public String adminD(){
//        return "adminDashboard";
//    }


    @GetMapping("/vendorLogin")
    public  String vender(){
        return "vendorLogin";
    }

    @PostMapping("/orders")
    public String order(){
        return "orders";
    }

    @PostMapping("/cart")
    public String cart(){
        return "cart";
    }

    @GetMapping("/about")
    public String about(){
        return "about";
    }

    @GetMapping("/contact")
    public String contact(){
        return "contact";
    }

    @PostMapping("/logout")
    public String logout(){
        return "index";
    }

    @PostMapping("/userprofile")
    public String userprofile(){
        return "userProfile";
    }




}
