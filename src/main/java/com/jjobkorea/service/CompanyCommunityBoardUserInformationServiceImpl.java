package com.jjobkorea.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.dto.CompanyCommunityBoardUserInformationDTO;
import com.jjobkorea.mapper.CompanyCommunityBoardUserInformationDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("CompanyCommunityBoardUserInformationService")
public class CompanyCommunityBoardUserInformationServiceImpl implements CompanyCommunityBoardUserInformationService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<CompanyCommunityBoardUserInformationDTO> list() {
		log.info("@# CompanyCommunityBoardUserInformationServiceImpl list 구현" );
		
		CompanyCommunityBoardUserInformationDAO dao = sqlSession.getMapper(CompanyCommunityBoardUserInformationDAO.class);
		ArrayList<CompanyCommunityBoardUserInformationDTO> list=dao.list();
		
		return list;
	}



}







