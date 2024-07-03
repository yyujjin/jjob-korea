package com.jjobkorea.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "admin_table")
@Data
public class Admin {
    @Id
    @Column(name = "admin_id", length = 50)
    private String adminId;

    @Column(name = "admin_name", length = 100, nullable = false)
    private String adminName;

    @Column(name = "admin_email", length = 100, nullable = false)
    private String adminEmail;
}
