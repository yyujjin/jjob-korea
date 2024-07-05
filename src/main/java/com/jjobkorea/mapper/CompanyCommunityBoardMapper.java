package com.jjobkorea.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.CompanyCommunityBoardDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface CompanyCommunityBoardMapper {
	public ArrayList<CompanyCommunityBoardDTO> companyBoardList();
	public void companyBoardWrite(HashMap<String, String> param);
	public CompanyCommunityBoardDTO companyBoardContentView(HashMap<String, String> param);
	public void companyBoardHit(HashMap<String, String> param);
	public CompanyCommunityBoardDTO companyBoardModifyView(HashMap<String, String> param);
	public void companyBoardModify(HashMap<String, String> param);
	public void companyBoardDelete(HashMap<String, String> param);
}
















