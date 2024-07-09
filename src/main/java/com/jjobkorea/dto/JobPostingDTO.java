package com.jjobkorea.dto;

import java.sql.Date;
import java.sql.Time;

import lombok.Data;

@Data
public class JobPostingDTO {
  
	private int id;
	//기업이름 (기업테이블이랑 JOIN하게되면 해당 변수 삭제하기)
	private String companyName;
	//채용 공고 사진
	private String postingImage;
	//채용 공고 제목
	private String postingTitle;
	//직무 
	private String jobTitle;
	//근무지역
	private String workLocation;
	//고용형태
	private String employmentType;
	//경력 여부
	private String jobExperience;
	//채용 마감 날짜
	private Date deadline;
	//조회수
	private int hit;
}
