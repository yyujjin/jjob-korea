package com.jjobkorea.service;

import java.util.List;

import com.jjobkorea.dto.ResumeInfoDTO;

public interface ResumeInfoService {
	List<ResumeInfoDTO> findByUserId(String userId);
    ResumeInfoDTO findByIdAndUserId(Long id, String userId);
    String findPhotoByUserID(Long resumeId);
    void insert(ResumeInfoDTO resumeInfoDTO);
    void update(ResumeInfoDTO resumeInfoDTO);
    void delete(Long id, String userId);
}
