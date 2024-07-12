package com.jjobkorea.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.JobseekerBoardAttachDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface JobseekerBoardAttachMapper {
//	파일업로드는 파라미터를 DTO 사용
	public void insertFile(JobseekerBoardAttachDTO vo);
	public List<JobseekerBoardAttachDTO> getFileList(int jobseekerCommunityBoardNum);
	public void deleteFile(String jobseekerCommunityBoardNum);
}