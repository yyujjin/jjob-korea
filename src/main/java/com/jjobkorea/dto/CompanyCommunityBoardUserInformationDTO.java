package com.jjobkorea.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CompanyCommunityBoardUserInformationDTO {
	private int companyCommunityBoardNum;
	private String companyCommunityBoardTitle;
	private String companyCommunityBoardContent;
	private Timestamp companyCommunityBoardDate;
	private int companyCommunityBoardHit;
	private int companyUserNum;
}









