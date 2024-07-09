package com.jjobkorea.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.JobPostingDTO;

@Mapper
public interface JobPostingMapper {
	
	//채용 정보 리스트 가져오기
	public List<JobPostingDTO> getPostingList();
	
}
