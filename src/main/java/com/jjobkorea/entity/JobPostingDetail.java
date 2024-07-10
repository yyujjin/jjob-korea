package com.jjobkorea.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;

@Entity
@Data
@NoArgsConstructor
public class JobPostingDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "signup_cp_id")
    private SignupCp signupCp;

    private String jobTitle;
    private String jobDescription;
    private String jobRequirements;
    private String employmentType;
    private String salary;
    private String location;
    private String applicationDeadline;
    private String contactEmail;
}
