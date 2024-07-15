package com.jjobkorea.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.FilterDTO;
import com.jjobkorea.dto.JobPostingDTO;

@Mapper
public interface JobPostingMapper {

	//메인 페이지 진입시 채용 정보 리스트 가져오기
	public List<JobPostingDTO> getPostingListToMain();

	//채용 공고 페이지 진입시 리스트 가져오기
	public List<JobPostingDTO> getPostingList();
	
	//선택조건 리스트 가져오기
	public List<JobPostingDTO> getSearchList(FilterDTO dto);
	
}