package com.jjobkorea.entity;

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

    private String companyType;
    private String companyRegistrationNum;
    private String companyName;
    private String companyRepresentativeName;
    private String companyAddr;
    private String companyBusinessRegistration;
}
