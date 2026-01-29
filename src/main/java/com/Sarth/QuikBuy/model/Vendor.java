package com.Sarth.QuikBuy.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "vendors")
@Data
public class Vendor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(name = "shop_name")
    private String shopName;

    @Column(name = "gst_number")
    private String gstNumber;

    @Column(name = "bank_account")
    private String bankAccount;

    private boolean verified = false;
}