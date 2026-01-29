package com.Sarth.QuikBuy.service;


import com.Sarth.QuikBuy.model.User;
import com.Sarth.QuikBuy.model.Vendor;
import com.Sarth.QuikBuy.repository.UserRepository;
import com.Sarth.QuikBuy.repository.VendorRepository;
import org.springframework.stereotype.Service;

@Service
public class VendorServices {


    private final UserRepository userRepository;
    private final VendorRepository vendorRepository;

    public VendorServices(UserRepository userRepository,
                             VendorRepository vendorRepository) {
        this.userRepository = userRepository;
        this.vendorRepository = vendorRepository;
    }

    public Vendor authenticateVendor(String username, String password) {

        // 1️⃣ Find user by username
        User user = userRepository.findByUsername(username);

        if (user == null) return null;

        // 2️⃣ Check password
        if (!user.getPassword().equals(password)) return null;

        // 3️⃣ Check role
        if (user.getRole() != User.Role.VENDOR) return null;

        // 4️⃣ NEW: Check if the user is BLOCKED or INACTIVE
        if (user.getStatus() == User.Status.BLOCKED || !user.isActive()) {
            // We throw a specific runtime exception to catch it in the controller
            throw new RuntimeException("V_BLOCKED");
        }

        // 5️⃣ Fetch vendor using user_id
        return vendorRepository.findByUser(user);
    }
}
