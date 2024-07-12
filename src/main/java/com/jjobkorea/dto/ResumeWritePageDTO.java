package com.jjobkorea.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//이력서 관리쪽 DTO
public class ResumeWritePageDTO {
	private int Id;
	private String resumePageUserId;
	private String resumePageTitle;
	private Date resumePageWriteDate;
}