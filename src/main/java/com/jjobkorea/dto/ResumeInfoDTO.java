package com.jjobkorea.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//이력서 작성 페이지 DTO
public class ResumeInfoDTO {
//인적사항란
	private int Id;
	private String resumeUserName;
	private Date resumeBirthDay;
	private int resumeGender;
	private String resumeUserEmail;
	private String resumeUserPhone;
	private String resumeUserCellPhone;
	private String resumeUserAddress;
	private String resumeProfilePhoto;
	private String resumeSkillName;
	private String resumePageUserId;
//학력란
	private String resumeEduStage;
	private String resumeSchoolName;
//경력란
	private String resumeCpName;
	private String resumeCpDept;
	private Date resumeCpJoinDate;
	private Date resumeCpLeaveDate;
	private String resumeCpPosition;
	private String resumeCpDuty;
	private int resumeCpSalary;
//	포트폴리오와 자기소개서 작성란
	private String resumePortpolio;
	private String resumeIntroduce;
}