package com.jjobkorea.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.CompanyBoardCommentDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface CompanyBoardCommentMapper {
	public void save(HashMap<String, String> param);
	public ArrayList<CompanyBoardCommentDTO> findAll(HashMap<String, String> param);
}
















