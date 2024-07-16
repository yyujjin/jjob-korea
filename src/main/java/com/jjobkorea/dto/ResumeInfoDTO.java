package com.jjobkorea.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.RequiredArgsConstructor;
@Data
@RequiredArgsConstructor
//이력서 작성 페이지 DTO
public class ResumeInfoDTO {
    // 인적사항란
    private int Id;
    private String resumeUserName;
//    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private String resumeBirthDay;
    private int resumeGender;
    private String resumeUserEmail;
    private String resumeUserPhone;
    private String resumeUserCellPhone;
    private String resumeUserAddress;
    // 이거 자체로 받아서 디비에 들어갈 때 시리얼라이즈가 안된다. 라는 문제가 있었어. 
    private MultipartFile resumeProfilePhoto;
    // 이 필드를 생성하고 스트링 파일 PATH 를 넣어주는 필드를 생성했음. 
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
    private int resumeCpSalary;
    // 포트폴리오와 자기소개서 작성란
    private String resumePortfolio;
    private String resumeIntroduce;
}