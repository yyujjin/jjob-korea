package com.jjobkorea.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.JobseekerBoardDTO;
import com.jjobkorea.dto.JobseekerCriteria;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface JobseekerPageMapper {
//	Criteria 객체를 이용해서 페이징 처리
	public ArrayList<JobseekerBoardDTO> listWithPaging(JobseekerCriteria cri);
//	public int getTotalCount();
	public int getTotalCount(JobseekerCriteria cri);
}
