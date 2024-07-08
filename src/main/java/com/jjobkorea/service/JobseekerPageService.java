package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.jjobkorea.dto.JobseekerBoardDTO;
import com.jjobkorea.dto.JobseekerCriteria;

public interface JobseekerPageService {
	public ArrayList<JobseekerBoardDTO> listWithPaging(JobseekerCriteria cri);
//	public int getTotalCount();
	public int getTotalCount(JobseekerCriteria cri);
}
