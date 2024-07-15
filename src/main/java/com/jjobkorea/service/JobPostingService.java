package com.jjobkorea.service;

import java.util.List;

import com.jjobkorea.dto.FilterDTO;
import com.jjobkorea.dto.JobPostingDTO;

public interface JobPostingService {

	//메인 페이지 진입시 채용 정보 리스트 가져오기
	public List<JobPostingDTO> getJobPostingSToMain();

	// 채용 정보 페이지 진입시 채용 공고 리스트 가져오기
	public List<JobPostingDTO> getPostingList(int pageNum);
	
	//상세 조건 검색 리스트 가져오기
	public List<JobPostingDTO> getSearchList(List<String> filterList,FilterDTO dto);


}
