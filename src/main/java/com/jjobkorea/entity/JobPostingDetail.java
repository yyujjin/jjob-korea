package com.jjobkorea.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "job_posting_detail")
@Data
public class JobPostingDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String jobTitle;
    private String employmentType;
    private String salary;
    private String location;
    private String applicationDeadline;
    private String contactEmail;
    private String jobRequirements;
    private String jobDescription;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private SignupCp company;
}
