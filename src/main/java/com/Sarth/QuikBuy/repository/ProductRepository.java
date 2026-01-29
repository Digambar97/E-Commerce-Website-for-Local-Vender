package com.Sarth.QuikBuy.repository;

import com.Sarth.QuikBuy.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    // Corrected: Filter by the vendor's ID, not the product's own ID
    @Query("SELECT p FROM Product p WHERE p.vendor.id = :vendorId")
    List<Product> findByVendorId(@Param("vendorId") Long vendorId);

    @Query("SELECT COUNT(p) FROM Product p WHERE p.vendor.id = :vendorId")
    int countByVendorId(@Param("vendorId") Long vendorId);
}

