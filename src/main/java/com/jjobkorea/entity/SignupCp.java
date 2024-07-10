package com.jjobkorea.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
public class SignupCp {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String companyName;
    private String companyType;
    private String companyRegistrationNum;
    private String companyRepresentativeName;
    private String companyAddr;
    private String companyBusinessRegistration;

    @OneToMany(mappedBy = "signupCp", cascade = CascadeType.ALL)
    private List<JobPostingDetail> jobPostingDetails;
}
