package com.jjobkorea.dao.bin;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.bin.CompanyCommunityBoardDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface CompanyCommunityBoardDAO {
	public ArrayList<CompanyCommunityBoardDTO> list();
//	public void write(CompanyCommunityBoardDAO companyCommunityBoardDAO);
	public void write(HashMap<String, String> param);
	public CompanyCommunityBoardDTO contentView(HashMap<String, String> param);
	public void hit(HashMap<String, String> param);
	public CompanyCommunityBoardDTO modifyView(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
}
















