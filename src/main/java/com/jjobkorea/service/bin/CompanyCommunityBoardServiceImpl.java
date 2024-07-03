package com.jjobkorea.service.bin;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.dao.bin.CompanyCommunityBoardDAO;
import com.jjobkorea.dto.bin.CompanyCommunityBoardDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("companyCommunityBoardService")
public class CompanyCommunityBoardServiceImpl implements CompanyCommunityBoardService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<CompanyCommunityBoardDTO> list() {
		log.info("@# companyCommunityBoardServiceImpl list 구현" );
		
		CompanyCommunityBoardDAO dao = sqlSession.getMapper(CompanyCommunityBoardDAO.class);
		ArrayList<CompanyCommunityBoardDTO> list=dao.list();
		
		return list;
	}

	@Override
//	public void write(CompanyCommunityBoardDAO companyCommunityBoardDAO) {
	public void write(HashMap<String, String> param) {
		log.info("@# CompanyCommunityBoardServiceImpl write 구현");
		
		CompanyCommunityBoardDAO dao = sqlSession.getMapper(CompanyCommunityBoardDAO.class);
		dao.write(param);
	}

	@Override
	public CompanyCommunityBoardDTO contentView(HashMap<String, String> param) {
		log.info("@# CompanyCommunityBoardServiceImpl content_view 구현단");
		
		CompanyCommunityBoardDAO dao = sqlSession.getMapper(CompanyCommunityBoardDAO.class);
		CompanyCommunityBoardDTO dto = dao.contentView(param);
		
		return dto;
	}
	@Override
	public CompanyCommunityBoardDTO modifyView(HashMap<String, String> param) {
		log.info("@# CompanyCommunityBoardServiceImpl modify_view 구현단");
		
		CompanyCommunityBoardDAO dao = sqlSession.getMapper(CompanyCommunityBoardDAO.class);
		CompanyCommunityBoardDTO dto = dao.modifyView(param);
		
		return dto;
	}
	
	

	@Override
	public void hit(HashMap<String, String> param) {
		log.info("CompanyCommunityBoardNum 작동" );
		
		CompanyCommunityBoardDAO dao = sqlSession.getMapper(CompanyCommunityBoardDAO.class);
		dao.hit(param);
	}
	
	@Override
	public void modify(HashMap<String, String> param) {
		log.info("@# CompanyCommunityBoardServiceImpl modify 접근");
		
		CompanyCommunityBoardDAO dao = sqlSession.getMapper(CompanyCommunityBoardDAO.class);
		dao.modify(param);
	}
	
	@Override
	public void delete(HashMap<String, String> param) {
		log.info("@# CompanyCommunityBoardServiceImpl delete 구현");
		
		CompanyCommunityBoardDAO dao = sqlSession.getMapper(CompanyCommunityBoardDAO.class);
		dao.delete(param);
	}

	

	
}







