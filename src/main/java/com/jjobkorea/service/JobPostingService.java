package com.jjobkorea.service;

import java.util.List;

import com.jjobkorea.dto.FilterDTO;
import com.jjobkorea.dto.JobPostingDTO;

public interface JobPostingService {

	// 채용 정보 리스트 가져오기
	public List<JobPostingDTO> getPostingList();
	
	//상세 조건 검색 리스트 가져오기
	public List<JobPostingDTO> getSearchList(List<String> filterList,FilterDTO dto);

}
