package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.jjobkorea.dto.CompanyCommunityBoardDTO;

public interface CompanyCommunityBoardService {
	public ArrayList<CompanyCommunityBoardDTO> companyBoardList();
	public void companyBoardWrite(HashMap<String, String> param);
	public CompanyCommunityBoardDTO companyBoardContentView(HashMap<String, String> param);
	public void companyBoardHit(HashMap<String, String> param);
	public CompanyCommunityBoardDTO companyBoardModifyView(HashMap<String, String> param);
	public void companyBoardModify(HashMap<String, String> param);
	public void companyBoardDelete(HashMap<String, String> param);
}
