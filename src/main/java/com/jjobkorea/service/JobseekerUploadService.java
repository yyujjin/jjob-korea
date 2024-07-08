package com.jjobkorea.service;

import java.util.List;

import com.jjobkorea.dto.JobseekerBoardAttachDTO;

public interface JobseekerUploadService {
	public List<JobseekerBoardAttachDTO> getFileList(int jobseekerCommunityBoardNum);
	public void deleteFiles(List<JobseekerBoardAttachDTO> fileList);
}