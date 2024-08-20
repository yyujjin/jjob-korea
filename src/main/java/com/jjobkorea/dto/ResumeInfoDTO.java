package com.jjobkorea.dto;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.Pattern;
import lombok.Data;
import lombok.RequiredArgsConstructor;
@Data
@RequiredArgsConstructor
//이력서 작성 페이지 DTO
public class ResumeInfoDTO {
    // 인적사항란
    private Long id;
    private String resumeUserName;
//  @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private String resumeBirthDay;
    private String resumePageTitle;
    private int resumeGender;
    private String resumeUserEmail;
    private String resumeUserPhone;
    private String resumeUserCellPhone;
    private String resumeUserAddress;
//  DB에 들어가는 값
    private MultipartFile resumeProfilePhoto;
//  String 값
    private String resumeFilePath;
    private String resumeSkillName;
    private String resumePageUserId;
    // 학력란
    private String resumeEduStage;
    private String resumeSchoolName;
    // 경력란
    private String resumeCpName;
    private String resumeCpDept;
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String resumeCpJoinDate;
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String resumeCpLeaveDate;
    private String resumeCpPosition;
    private String resumeCpDuty;
    private String resumeCpSalary;
    // 포트폴리오와 자기소개서 작성란
    private String resumePortfolio;
    private String resumeIntroduce;
}