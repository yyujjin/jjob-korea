package com.jjobkorea.dto;

import java.time.LocalDate;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class JobPostingDTO {

    private int id;
    // 기업 이름 (기업 테이블이랑 JOIN하게 되면 해당 변수 삭제)
    private String companyName;
    
    // 채용 공고 사진
//    private String postingImage;
    
    // 채용 공고 제목
    private String postingTitle;
    
    // 직무
    private String jobTitle;
    
    // 근무지역
    private String workLocation;
    
    // 고용형태
    private String employmentType;
    
    // 경력 여부
    private String jobExperience;
    
    // 채용 마감 날짜
    private LocalDate deadline;
    
    // 조회수
    private int hit;
    
    // D-DAY
    private long countdownDays;
    
    // 기업 아이디 (외래키 설정)
    private int companyId;
    
    // 급여 (디비에 추가함)
    private String money;
    
    // 추가된 필드들
    // 파일이 저장된 경로 또는 S3 URL
    private MultipartFile jobPostingUploadPath;
    
    private String jobPostingFilePath;
    //상세정보
    private String postingdetails;

}
