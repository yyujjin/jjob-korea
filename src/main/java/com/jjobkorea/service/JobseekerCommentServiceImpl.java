package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.mapper.JobseekerBoardMapper;
import com.jjobkorea.mapper.JobseekerCommentMapper;
import com.jjobkorea.dto.JobseekerCommentDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("CommentService")
public class JobseekerCommentServiceImpl implements JobseekerCommentService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void save(HashMap<String, String> param) {
		log.info("@# CommentServiceImpl save");
		
		JobseekerCommentMapper dao = sqlSession.getMapper(JobseekerCommentMapper.class);
		dao.save(param);
	}

	@Override
	public ArrayList<JobseekerCommentDTO> findAll(HashMap<String, String> param) {
		log.info("@# CommentServiceImpl findAll");
		
		JobseekerCommentMapper dao = sqlSession.getMapper(JobseekerCommentMapper.class);
		ArrayList<JobseekerCommentDTO> List = dao.findAll(param);
		
		return List;
	}

}