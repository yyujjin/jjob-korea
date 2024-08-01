package com.jjobkorea.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.jjobkorea.dto.ResumeInfoDTO;

@Mapper
public interface ResumeInfoMapper {
	List<ResumeInfoDTO> findByUserId(String userId);
    ResumeInfoDTO findByIdAndUserId(Long id, String userId);
    void insert(ResumeInfoDTO resumeInfoDTO);
    void update(ResumeInfoDTO resumeInfoDTO);
    void delete(Long id, String userId);
}
