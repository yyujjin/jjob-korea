package com.jjobkorea.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemDTO {
    private String memId;
    private String memPwd;
    private String memName;
    private String memPhone;
    private String memAddr;
    private String memEmail;
    private String memBirth;
    private char memGender;
    private Date memCreationDate;
    // 개인 기업 구분 로그인
    private int userType;
    
    // 기업 추가 정보
    private int cpId;
    private String companyType;
    private String companyRegistrationNum;
    private String companyRepresentativeName;
    private String companyName;
    private String companyAddr;
    private String companyBusinessRegistration; // 새로운 필드 추가

    // companyBusinessRegistration 필드의 getter와 setter 메소드 추가
    public String companyBusinessRegistration() {
        return companyBusinessRegistration;
    }

    public void companyBusinessRegistration(String companyBusinessRegistration) {
        this.companyBusinessRegistration = companyBusinessRegistration;
    }
}
