package com.jjobkorea.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyBoardCommentDTO {
	private int companyCommentNum;
	private String companyCommentWriter;
	private String companyCommentContent;
	private int companyCommunityBoardNum;
	private Timestamp companyCommentTime;
	private int companyUserNum;
}
