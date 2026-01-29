package com.Sarth.QuikBuy.repository;

import com.Sarth.QuikBuy.model.User;
import com.Sarth.QuikBuy.model.Vendor;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VendorRepository extends JpaRepository<Vendor, Long> {

    Vendor findByUser(User user);

}
