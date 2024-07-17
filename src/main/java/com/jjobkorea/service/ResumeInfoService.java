package com.jjobkorea.service;

import java.util.List;

import com.jjobkorea.dto.ResumeInfoDTO;

public interface ResumeInfoService {
	public List<ResumeInfoDTO> findAll();
	public void insert(ResumeInfoDTO resumeInfoDTO);
}
