package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface CompanyBoardCommentService {
	public void save(HashMap<String, String> param);
	public ArrayList<com.jjobkorea.dto.CompanyBoardCommentDTO> findAll(HashMap<String, String> param);
}
