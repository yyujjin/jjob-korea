package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.jjobkorea.dto.JobseekerCommentDTO;

public interface JobseekerCommentService {
	public void jobseekerSave(HashMap<String, String> param);
	public ArrayList<JobseekerCommentDTO> jobseekerFindAll(HashMap<String, String> param);
}
