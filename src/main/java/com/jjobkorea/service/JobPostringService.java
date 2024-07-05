package com.jjobkorea.service;

import java.util.List;

import com.jjobkorea.dto.JobPostringDTO;

public interface JobPostringService {

	// 채용 정보 리스트 가져오기
	public List<JobPostringDTO> getPostingList();

}
