package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.jjobkorea.dto.JobseekerCommentDTO;

public interface JobseekerCommentService {
	public void save(HashMap<String, String> param);
	public ArrayList<JobseekerCommentDTO> findAll(HashMap<String, String> param);
}
