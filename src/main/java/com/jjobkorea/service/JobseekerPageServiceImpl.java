package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.mapper.JobseekerBoardAttachMapper;
import com.jjobkorea.mapper.JobseekerBoardMapper;
import com.jjobkorea.mapper.JobseekerPageMapper;
import com.jjobkorea.dto.JobseekerBoardAttachDTO;
import com.jjobkorea.dto.JobseekerBoardDTO;
import com.jjobkorea.dto.JobseekerCriteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("PageService")
public class JobseekerPageServiceImpl implements JobseekerPageService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<JobseekerBoardDTO> listWithPaging(JobseekerCriteria cri) {
		log.info("@# PageServiceImpl listWithPaging");
		log.info("@# cri=>"+cri);
		
		JobseekerPageMapper dao = sqlSession.getMapper(JobseekerPageMapper.class);
		ArrayList<JobseekerBoardDTO> list=dao.listWithPaging(cri);
		
		return list;
	}

	@Override
//	public int getTotalCount() {
	public int getTotalCount(JobseekerCriteria cri) {
		log.info("@# PageServiceImpl getTotalCount");
		
		JobseekerPageMapper dao = sqlSession.getMapper(JobseekerPageMapper.class);
//		int total=dao.getTotalCount();
		int total=dao.getTotalCount(cri);
		
		return total;
	}

}