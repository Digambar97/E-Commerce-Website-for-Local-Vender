package com.Sarth.QuikBuy.controller;

import com.Sarth.QuikBuy.model.User;

import com.Sarth.QuikBuy.service.UserServices;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    UserServices userServices;


    @Autowired
    public UserController(UserServices userServices){
        this.userServices=userServices;
    }

    @PostMapping("/registerUser")
    public String registerUser(@ModelAttribute User user, HttpServletRequest req){


        user.setRole(User.Role.CUSTOMER);
        user.setStatus(User.Status.ACTIVE);
        user.setActive(true);

        userServices.saveUser(user);


        HttpSession session=req.getSession();
       session.setAttribute("user",user);
        return "redirect:/";
    }

}