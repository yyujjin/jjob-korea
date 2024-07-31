package com.jjobkorea.service;

import java.util.List;

import com.jjobkorea.dto.ResumeInfoDTO;

public interface ResumeInfoService {
	List<ResumeInfoDTO> findByUserId(String userId);
    ResumeInfoDTO findByIdAndUserId(Long id, String userId);
    void insert(ResumeInfoDTO resumeInfoDTO);
    void update(ResumeInfoDTO resumeInfoDTO);
}
