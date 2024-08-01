package com.jjobkorea.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
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
    
    @Override
    public List<ResumeInfoDTO> findByUserId(String userId) {
    	log.info("resumeFindByUserId");
    	return resumeInfoMapper.findByUserId(userId);
    }
    @Override
    public void insert(ResumeInfoDTO resumeInfoDTO) {
        log.info("Inserting ResumeInfoDTO: {}", resumeInfoDTO);
        resumeInfoMapper.insert(resumeInfoDTO); // Mapper의 insert() 메서드 호출
    }
	@Override
	public ResumeInfoDTO findByIdAndUserId(@Param("id") Long id, String userId) {
		log.info("resumefindByIdAndUserId");
		return resumeInfoMapper.findByIdAndUserId(id, userId);
	}
	@Override
	public void update(ResumeInfoDTO resumeInfoDTO) {
		resumeInfoMapper.update(resumeInfoDTO);
	}
	@Override
	public void delete(Long id, String userId) {
		resumeInfoMapper.delete(id, userId);
		
	}
}
