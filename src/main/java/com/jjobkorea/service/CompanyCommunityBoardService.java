package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.jjobkorea.dto.CompanyCommunityBoardDTO;

public interface CompanyCommunityBoardService {
	public ArrayList<CompanyCommunityBoardDTO> list();
//	public void write(CompanyCommunityBoardDTO companyCommunityBoardDTO);
	public void write(HashMap<String, String> param);
	public CompanyCommunityBoardDTO contentView(HashMap<String, String> param);
	public void hit(HashMap<String, String> param);
	public CompanyCommunityBoardDTO modifyView(HashMap<String, String> param);
	public void modify(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
}
