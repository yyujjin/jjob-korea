package com.jjobkorea.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "signup_cp")
@Data
public class SignupCp {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "companyType")
    private String companyType;

    @Column(name = "companyRegistrationNum")
    private String companyRegistrationNum;

    @Column(name = "companyName")
    private String companyName;

    @Column(name = "companyRepresentativeName")
    private String companyRepresentativeName;

    @Column(name = "companyAddr")
    private String companyAddr;

    @Column(name = "companyBusinessRegistration")
    private String companyBusinessRegistration;
}
