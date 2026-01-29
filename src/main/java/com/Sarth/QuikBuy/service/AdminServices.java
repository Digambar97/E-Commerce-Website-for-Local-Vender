package com.Sarth.QuikBuy.service;

import com.Sarth.QuikBuy.model.Order;
import com.Sarth.QuikBuy.model.User;
import com.Sarth.QuikBuy.repository.AdminRepository;
import com.Sarth.QuikBuy.repository.OrderRepository;
import com.Sarth.QuikBuy.repository.ProductRepository;
import com.Sarth.QuikBuy.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Service
public class AdminServices {

    private final AdminRepository adminRepo;
    private final ProductRepository productRepo;
    private final OrderRepository orderRepo;
    private final UserRepository userRepo;

    @Autowired
    public AdminServices(AdminRepository adminRepo,
                         ProductRepository productRepo,
                         OrderRepository orderRepo, UserRepository userRepo) {
        this.adminRepo = adminRepo;
        this.productRepo = productRepo;
        this.orderRepo = orderRepo;
        this.userRepo = userRepo;
    }

    public Map<String, Object> getDashboardStats() {
        Map<String, Object> stats = new HashMap<>();

        stats.put("totalUsers", adminRepo.count());
        stats.put("totalProducts", productRepo.count());
        stats.put("totalOrders", orderRepo.count());

        // Optimized: Database calculates sum directly
        Double revenue = orderRepo.getTotalRevenue();
        stats.put("totalRevenue", (revenue != null) ? revenue : 0.0);

        return stats;
    }

    public User vaildateAdmin(String uname, String pass) {
        // Ensure your AdminRepository has this method defined
        User user = adminRepo.findByUsernameAndRole(uname, User.Role.ADMIN);
        if (user != null && user.getPassword().equals(pass)) {
            return user;
        }
        return null;
    }

    public List<User> getAllUsers() {
        return userRepo.findAll();
    }


    public List<User> findAllVendors() {
        return adminRepo.findAll().stream()
                .filter(user -> user.getRole() == User.Role.VENDOR)
                .collect(Collectors.toList());
    }

    public void toggleVendorApproval(Long id) {
        User vendor = adminRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Vendor not found with id: " + id));

        // Toggle Boolean 'active' from your Model
        boolean newActiveStatus = !vendor.isActive();
        vendor.setActive(newActiveStatus);

        // Sync Enum 'Status' from your Model
        if (newActiveStatus) {
            vendor.setStatus(User.Status.ACTIVE);
        } else {
            vendor.setStatus(User.Status.BLOCKED);
        }

        adminRepo.save(vendor);
    }


    // src/main/java/com/Sarth/LeLo/service/AdminServices.java

    public List<Order> getAllOrders() {
        return orderRepo.findAll();
    }

    public void updateOrderStatus(Long orderId, Order.OrderStatus status) {
        Order order = orderRepo.findById(orderId).orElseThrow();
        order.setOrderStatus(status);
        orderRepo.save(order);
    }


    // src/main/java/com/Sarth/LeLo/service/AdminServices.java

    public List<Map<String, Object>> getInventoryDetails() {
        // You can also use a dedicated Inventory model if you have one
        // Here we fetch products and their stock levels
        return productRepo.findAll().stream().map(product -> {
            Map<String, Object> item = new HashMap<>();
            item.put("id", product.getId());
            item.put("name", product.getName());
            item.put("price", product.getPrice());
            // Assuming a getQuantity() exists in your Product or via a linked Inventory entity
            item.put("quantity", product.getInventory() != null ? product.getInventory().getQuantity() : 0);
            return item;
        }).collect(Collectors.toList());
    }


    // src/main/java/com/Sarth/LeLo/service/AdminServices.java

    public void blockUser(Long userId) {
        // Find the user by ID from the repository
        User user = userRepo.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Update the 'active' boolean and 'status' enum to match your model
        user.setActive(false);
        user.setStatus(User.Status.BLOCKED);
        userRepo.save(user);
    }

    public void unblockUser(Long userId) {
        User user = userRepo.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // Set user back to active
        user.setActive(true);
        user.setStatus(User.Status.ACTIVE);
        userRepo.save(user);
    }


}
