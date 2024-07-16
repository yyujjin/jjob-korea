package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.dto.ResumeWritePageDTO;
import com.jjobkorea.mapper.ResumeWritePageMapper;

import lombok.extern.slf4j.Slf4j;

@Service("ResumeWritePageService")
@Slf4j
public class ResumeWritePageServiceImpl implements ResumeWritePageService{
	@Autowired
	private ResumeWritePageMapper resumeWritePageMapper;
	@Override
	public List<ResumeWritePageDTO> getAllResumes() {
		return resumeWritePageMapper.getAllResumes();
	}

	@Override
	public void insertResume(ResumeWritePageDTO resume) {
		resumeWritePageMapper.insertResume(resume);
		
	}

}
