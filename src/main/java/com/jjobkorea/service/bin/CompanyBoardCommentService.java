package com.jjobkorea.service.bin;

import java.util.ArrayList;
import java.util.HashMap;

public interface CompanyBoardCommentService {
	public void save(HashMap<String, String> param);
	public ArrayList<com.jjobkorea.dto.bin.CompanyBoardCommentDTO> findAll(HashMap<String, String> param);
}
