package com.jjobkorea.service;

import java.util.List;

import com.jjobkorea.dto.JobPostingDTO;

public interface JobPostingService {

	// 채용 정보 리스트 가져오기
	public List<JobPostingDTO> getPostingList();

}
