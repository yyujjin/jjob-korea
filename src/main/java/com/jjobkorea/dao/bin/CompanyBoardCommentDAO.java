package com.jjobkorea.dao.bin;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.bin.CompanyBoardCommentDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface CompanyBoardCommentDAO {
	public void save(HashMap<String, String> param);
	public ArrayList<CompanyBoardCommentDTO> findAll(HashMap<String, String> param);
}
















