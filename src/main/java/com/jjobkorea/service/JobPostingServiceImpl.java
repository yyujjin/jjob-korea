package com.jjobkorea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.mapper.JobPostingMapper;

@Service
public class JobPostingServiceImpl implements JobPostingService {

	@Autowired
	JobPostingMapper jobPostringMapper;
	
	
	//채용 정보 리스트 가져오기
	@Override
	public List<JobPostingDTO> getPostingList() {
		
		return jobPostringMapper.getPostingList();
	}

}
