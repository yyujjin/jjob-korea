package com.jjobkorea.entity;

import lombok.Data;
import jakarta.persistence.*;

@Entity
@Data
public class CompanyContactInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long contactId;

    private Long companyId;
    private String companyAddress;
    private String companyCallNumber;
    private String companyFax;
    private String companyMail;
    private String companySite;
}
