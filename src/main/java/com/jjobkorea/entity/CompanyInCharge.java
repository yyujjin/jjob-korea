package com.jjobkorea.entity;

import lombok.Data;
import jakarta.persistence.*;

@Entity
@Data
public class CompanyInCharge {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long inChargeId;

    private Long companyId;
    private String inChargeName;
    private String inChargeDep;
    private String inChargePosition;
    private String inChargePhone;
    private String inChargeMail;
}
