package com.jjobkorea.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Service;

import com.jjobkorea.mapper.JobseekerBoardAttachMapper;
import com.jjobkorea.dto.JobseekerBoardAttachDTO;

import ch.qos.logback.core.spi.AppenderAttachable;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("UploadService")
public class JobseekerUploadServiceImpl implements JobseekerUploadService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<JobseekerBoardAttachDTO> getFileList(int jobseekerCommunityBoardNum) {
		log.info("@# UploadServiceImpl getFileList");
		
		JobseekerBoardAttachMapper dao = sqlSession.getMapper(JobseekerBoardAttachMapper.class);
		
		return dao.getFileList(jobseekerCommunityBoardNum);
	}

	//폴더에 저장된 파일들 삭제
	@Override
	public void deleteFiles(List<JobseekerBoardAttachDTO> fileList) {
		log.info("@# deleteFiles()");
		log.info("@# fileList=>"+fileList);
		
		if (fileList == null || fileList.size() == 0) {
			return;
		}
		
		fileList.forEach(attach -> {
			try {
				Path file = Paths.get("D:\\dev\\upload\\"+attach.getJobseekerBoardAttachUploadPath()+"\\"
											 +attach.getJobseekerBoardAttachUuid()+"_"+attach.getJobseekerBoardAttachFileName());
				Files.deleteIfExists(file);
				
				if (Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("D:\\dev\\upload\\"+attach.getJobseekerBoardAttachUploadPath()+"\\s_"
							+attach.getJobseekerBoardAttachUuid()+"_"+attach.getJobseekerBoardAttachFileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error"+e.getMessage());
			}
		});//end of forEach
	}

}
