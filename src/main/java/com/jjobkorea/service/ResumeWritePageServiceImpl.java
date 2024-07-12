package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.jjobkorea.dto.ResumeWritePageDTO;

import lombok.extern.slf4j.Slf4j;

@Service("ResumeWritePageService")
@Slf4j
public class ResumeWritePageServiceImpl implements ResumeWritePageService{
	@Override
	public ArrayList<ResumeWritePageDTO> list(HashMap<String, String> param) {
		log.info("@#ResumeWritePageServiceImpl list");
		
		return list(param);
	}

}
