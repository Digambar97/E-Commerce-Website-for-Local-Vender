package com.Sarth.QuikBuy.repository;

import com.Sarth.QuikBuy.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}
