package com.jjobkorea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.dto.JobPostringDTO;
import com.jjobkorea.mapper.JobPostringMapper;

@Service
public class JobPostringServiceImpl implements JobPostringService {

	@Autowired
	JobPostringMapper jobPostringMapper;
	
	
	//채용 정보 리스트 가져오기
	@Override
	public List<JobPostringDTO> getPostingList() {
		
		return jobPostringMapper.getList();
	}

}
