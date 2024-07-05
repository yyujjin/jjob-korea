package com.jjobkorea.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.JobPostingDTO;

@Mapper
public interface JobPostingMapper {
	
	public List<JobPostingDTO> getPostingList();
	
	
}
