package com.jjobkorea.entity;

import lombok.Data;
import jakarta.persistence.*;

@Entity
@Table(name = "jobposting")
@Data
public class JobPostingInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

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
    private java.sql.Date deadline;

    @Column(name = "hit")
    private int hit;
}
