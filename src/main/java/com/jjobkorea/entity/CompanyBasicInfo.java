package com.jjobkorea.entity;

import lombok.Data;
import jakarta.persistence.*;

@Entity
@Data
public class CompanyBasicInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long companyId;

    private String companyName;
    private String businessRegistrationNumber;
    private String ownerName;
    private String ownerNumber;
    private String ownerEmail;
}
