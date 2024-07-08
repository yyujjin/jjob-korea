package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.jjobkorea.dto.CompanyBoardCommentDTO;

public interface CompanyBoardCommentService {
	public void save(HashMap<String, String> param);
	public ArrayList<CompanyBoardCommentDTO> allFind(HashMap<String, String> param);
}
