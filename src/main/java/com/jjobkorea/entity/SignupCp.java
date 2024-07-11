package com.jjobkorea.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "signup_cp")
@Data
public class SignupCp {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  // 변경

    private String companyType;
    private String companyRegistrationNum;
    private String companyName;
    private String companyRepresentativeName;
    private String companyAddr;
    private String companyBusinessRegistration;
}
