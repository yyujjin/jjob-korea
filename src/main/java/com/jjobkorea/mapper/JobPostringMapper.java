package com.jjobkorea.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.JobPostringDTO;

@Mapper
public interface JobPostringMapper {
	
	public List<JobPostringDTO> getList();
	
	
}
