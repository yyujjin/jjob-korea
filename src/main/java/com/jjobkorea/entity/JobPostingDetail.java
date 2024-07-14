package com.jjobkorea.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Entity
@Table(name = "job_posting_detail")
@Data
public class JobPostingDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String positionCount;

    private String skills;
    private String coreCompetencies;
    private String qualifications;
    private String preferredConditions;

    private String employmentType;
    private String location;
    private String workHours;

    private String benefits = "기본 복지 혜택";  // 기본값 설정
    private String hiringProcess = "기본 전형 절차";  // 기본값 설정
    private String notes = "기본 유의사항";  // 기본값 설정

    @Transient
    private MultipartFile companyLogo;

    @Transient
    private MultipartFile jobPostingImage;

    private String companyLogoPath;
    private String jobPostingImagePath;
}
