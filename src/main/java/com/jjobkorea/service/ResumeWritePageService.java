package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.jjobkorea.dto.ResumeWritePageDTO;

public interface ResumeWritePageService {
	public ArrayList<ResumeWritePageDTO> list(HashMap<String, String> param);
}
