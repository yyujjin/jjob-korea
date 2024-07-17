package com.jjobkorea.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.ResumeInfoDTO;

@Mapper
public interface ResumeInfoMapper {
    List<ResumeInfoDTO> findAll();
    void insert(ResumeInfoDTO resumeInfoDTO);
}
