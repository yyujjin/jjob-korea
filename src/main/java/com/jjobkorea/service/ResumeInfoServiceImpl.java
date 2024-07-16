package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.dto.ResumeInfoDTO;
import com.jjobkorea.mapper.ResumeInfoMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ResumeInfoServiceImpl implements ResumeInfoService {

    @Autowired
    private ResumeInfoMapper resumeInfoMapper; // Repository 역할을 수행하는 Mapper
    
    private List<ResumeInfoDTO> resumeInfoList = new ArrayList<>();
    @Override
    public List<ResumeInfoDTO> findAll() {
        log.info("Finding all ResumeInfoDTOs");
        return resumeInfoList; // 재귀 호출을 방지하기 위해 변경
    }
    @Override
    public void insert(ResumeInfoDTO resumeInfoDTO) {
        log.info("Inserting ResumeInfoDTO: {}", resumeInfoDTO);
        resumeInfoMapper.insert(resumeInfoDTO); // Mapper의 insert() 메서드 호출
    }
}
