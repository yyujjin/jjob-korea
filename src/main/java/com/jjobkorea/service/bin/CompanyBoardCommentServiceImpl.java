package com.jjobkorea.service.bin;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.dao.bin.CompanyBoardCommentDAO;
import com.jjobkorea.dto.bin.CompanyBoardCommentDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("CompanyBoardCommentService")
public class CompanyBoardCommentServiceImpl implements CompanyBoardCommentService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void save(HashMap<String, String> param) {
		log.info("@# CompanyBoardCommentServiceImpl save");
		
		com.jjobkorea.dao.bin.CompanyBoardCommentDAO dao = sqlSession.getMapper(com.jjobkorea.dao.bin.CompanyBoardCommentDAO.class);
		dao.save(param);
	}

	@Override
	public ArrayList<com.jjobkorea.dto.bin.CompanyBoardCommentDTO> findAll(HashMap<String, String> param) {
		log.info("@# CompanyBoardCommentServiceImpl findAll");
		
		CompanyBoardCommentDAO dao = sqlSession.getMapper(CompanyBoardCommentDAO.class);
		ArrayList<CompanyBoardCommentDTO> list = dao.findAll(param);
		
		return list;
	}

}







