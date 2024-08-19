package com.jjobkorea.entity;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Entity
@Data
public class JobPostingDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String memName;
    private String memPhone;
    private String memEmail;
    private String companyAddr;
    private String companyName;
    private String companyBusinessRegistration;
    private String jobTitle;
    private String employmentType;
    private String salary;
    private String location;
    private String experience;
    private String education;
    private String skills;
    private String coreCompetencies;
    private String workHours;
    private String positionLevel;
    private String industry;
    private String employeeCount;
    private String establishedYear;
    private String companyType;
    private String companyWebsite;
    private String companyIntroduction;
    
    @NotNull
    @Positive
    private Integer positionCount;
    private String positionResponsibilities;
    private String qualifications;
    private String preferredConditions;
    private String benefits;
    private String hiringProcess;
    private String notes;
    private String companyLogoPath;
    private String jobPostingImagePath;

    @ElementCollection(fetch = FetchType.EAGER)
    private List<String> additionalImagePaths = new ArrayList<>();

    private transient List<MultipartFile> additionalImages;
    private transient MultipartFile companyLogo;
    private transient MultipartFile jobPostingImage;

    // Getters and setters
}
