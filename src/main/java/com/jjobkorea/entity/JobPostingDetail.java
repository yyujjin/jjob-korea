package com.jjobkorea.entity;

import lombok.Data;

import java.util.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "job_posting_detail")
@Data
public class JobPostingDetail {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "companyName")
    private String companyName;

    @Column(name = "postingImage")
    private String postingImage;

    @Column(name = "postingTitle")
    private String postingTitle;

    @Column(name = "jobTitle")
    private String jobTitle;

    @Column(name = "workLocation")
    private String workLocation;

    @Column(name = "employmentType")
    private String employmentType;

    @Column(name = "jobExperience")
    private String jobExperience;

    @Column(name = "deadline")
    private Date deadline;

    @Column(name = "hit")
    private int hit;

    @ManyToOne
    @JoinColumn(name = "companyId")
    private SignupCp company;
}
