package com.Sarth.QuikBuy.service;

import com.Sarth.QuikBuy.model.*;
import com.Sarth.QuikBuy.repository.CategoryRepository;
import com.Sarth.QuikBuy.repository.ProductRepository;
import com.Sarth.QuikBuy.repository.VendorRepository;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ProductServices {

    private final ProductRepository repo;
    private final VendorRepository vendorRepo;
    private final CategoryRepository categoryRepo;

    public ProductServices(ProductRepository repo,
                           VendorRepository vendorRepo,
                           CategoryRepository categoryRepo) {
        this.repo = repo;
        this.vendorRepo = vendorRepo;
        this.categoryRepo = categoryRepo;
    }

    public List<Product> getProductsByVendor(Long vendorId) {
        return repo.findByVendorId(vendorId);
    }

    public int countProductsByVendor(Long vendorId) {
        return repo.countByVendorId(vendorId);
    }

    public void saveProduct(Product product,
                            int stock,
                            Long categoryId,
                            String imageUrl,
                            User user) {

        // 1️⃣ Find vendor
        Vendor vendor = vendorRepo.findByUser(user);
        if (vendor == null) {
            throw new RuntimeException("Vendor not found for user");
        }
        product.setVendor(vendor);

        // 2️⃣ Set category
        Category category = categoryRepo.findById(categoryId)
                .orElseThrow(() -> new RuntimeException("Category not found"));
        product.setCategory(category);

        // 3️⃣ DEFAULT STATUS (IMPORTANT)
        if (product.getStatus() == null) {
            product.setStatus(Product.ProductStatus.ACTIVE);
        }

        // 4️⃣ SAVE PRODUCT FIRST (ID GENERATED HERE)
        Product savedProduct = repo.save(product);

        // 5️⃣ Inventory
        Inventory inventory = new Inventory();
        inventory.setProduct(savedProduct);
        inventory.setQuantity(stock);
        savedProduct.setInventory(inventory);

        // 6️⃣ Product Image
        ProductImage image = new ProductImage();
        image.setProduct(savedProduct);
        image.setImageUrl(imageUrl);
        savedProduct.setImages(List.of(image));

        // 7️⃣ SAVE AGAIN (CASCADE HANDLES CHILD TABLES)
        repo.save(savedProduct);
    }

    public List<Product> getAllProducts() {
        return repo.findAll();
    }

    public void deleteProduct(Long id) {
        // Problem Solving: Ensure product exists before deletion
        if(repo.existsById(id)) {
            repo.deleteById(id);
        } else {
            throw new RuntimeException("Product not found with id: " + id);
        }
    }
}
