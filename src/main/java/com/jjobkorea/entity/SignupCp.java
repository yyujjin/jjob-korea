package com.jjobkorea.entity;

import lombok.Data;
import jakarta.persistence.*;

@Entity
@Table(name = "signup_cp")
@Data
public class SignupCp {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "companyType")
    private String companyType;

    @Column(name = "companyRegistrationNum", unique = true)
    private String companyRegistrationNum;

    @Column(name = "companyName")
    private String companyName;

    @Column(name = "companyRepresentativeName")
    private String companyRepresentativeName;

    @Column(name = "companyAddr")
    private String companyAddr;

    @Column(name = "companyBusinessRegistration", unique = true)
    private String companyBusinessRegistration;
}
