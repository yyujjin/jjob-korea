package com.jjobkorea.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JobseekerBoardAttachDTO {
	private String jobseekerBoardAttachUuid;
	private String jobseekerBoardAttachUploadPath;
	private String jobseekerBoardAttachFileName;
	private boolean jobseekerBoardAttachImage;
	private int jobseekerCommunityBoardNum;
}
