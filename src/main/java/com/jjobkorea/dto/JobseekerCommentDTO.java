package com.jjobkorea.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JobseekerCommentDTO {
	private int jobseekerCommentBoardNum;
	private String jobseekerCommentCommentWriter;
	private String jobseekerCommunityCommentContent;
	private int jobseekerCommunityBoardNum;
	private Timestamp jobseekerCommentTime;
}