package com.jjobkorea.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.ResumeWritePageDTO;

@Mapper
public interface ResumeWritePageMapper {
	public ArrayList<ResumeWritePageDTO> list();
}
