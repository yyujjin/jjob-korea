package com.jjobkorea.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class JobPosting {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private Company company;
}
