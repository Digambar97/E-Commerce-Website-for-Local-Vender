package com.Sarth.QuikBuy.service;

import com.Sarth.QuikBuy.model.User;
import com.Sarth.QuikBuy.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServices {

    private final UserRepository usrepo;

    @Autowired
    public UserServices(UserRepository usrepo) {
        this.usrepo = usrepo;
    }

    // UserServices.java

    public User validateUser(String username, String password) {
        User user = usrepo.findByUsernameAndRole(username, User.Role.CUSTOMER);

        if (user != null && user.getPassword().equals(password)) {
            // CHECK STATUS HERE: Assuming your Enum has 'BLOCKED'
            if (user.getStatus() == User.Status.BLOCKED || !user.isActive()) {
                return null; // Logic will treat this as an invalid login
            }
            return user;
        }
        return null;
    }

    public void saveUser(User user) {
        usrepo.save(user);
    }

}

