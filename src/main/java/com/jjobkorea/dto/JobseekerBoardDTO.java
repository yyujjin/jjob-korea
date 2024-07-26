package com.jjobkorea.dto;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JobseekerBoardDTO {
	private int jobseekerCommunityBoardNum;
	private String jobseekerCommunityBoardName;
	private String jobseekerCommunityBoardTitle;
	private String jobseekerCommunityBoardContent;
	private Timestamp jobseekerCommunityBoardDate;
	private int jobseekerCommunityBoardHit;
	private List<JobseekerBoardAttachDTO> attachList;
	
	// 좋아요
	private int likes;
	private String likedBy;
	
}
