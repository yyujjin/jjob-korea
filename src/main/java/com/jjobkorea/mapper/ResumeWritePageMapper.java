package com.jjobkorea.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.ResumeWritePageDTO;

@Mapper
public interface ResumeWritePageMapper {
	    List<ResumeWritePageDTO> getAllResumes();

	    void insertResume(ResumeWritePageDTO resume);
	}
