package com.jjobkorea.dto;

import lombok.Data;

import java.sql.Date;

@Data
public class CompanyDTO {
    private int id;
    //업종 (ex 가구회사, 건설회사...)
    private String res;
    //직원수
    private int employeeCount;
    //기업 규모 (대기업, 중소기업, 스타트업)
    private String companyType;
    //연봉
    private int salary;
    //대표자
    private String ceo;
    //회사이름
    private String name;
    //설립년도
    private Date birthd;
    //주소
    private String addr;
    //사업자등록번호
    private String businssNum;
}
