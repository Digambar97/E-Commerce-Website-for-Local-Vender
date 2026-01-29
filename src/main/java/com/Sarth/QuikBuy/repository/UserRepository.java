
package com.Sarth.QuikBuy.repository;

import com.Sarth.QuikBuy.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Long> {
    User findByUsername(String username);

    User findByUsernameAndRole(String username, User.Role role);
}
