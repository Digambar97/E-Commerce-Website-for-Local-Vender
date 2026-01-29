package com.Sarth.QuikBuy.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "addresses")
@Data
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "address_line", columnDefinition = "TEXT")
    private String addressLine;

    private String city;
    private String state;
    private String pincode;
    private String country;

    @Column(name = "is_default")
    private boolean isDefault = false;
}