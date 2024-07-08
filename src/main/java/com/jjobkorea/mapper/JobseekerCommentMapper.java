package com.jjobkorea.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.JobseekerBoardDTO;
import com.jjobkorea.dto.JobseekerCommentDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface JobseekerCommentMapper {
	public void save(HashMap<String, String> param);
	public ArrayList<JobseekerCommentDTO> findAll(HashMap<String, String> param);
}
