package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.dto.CompanyCommunityBoardDTO;
import com.jjobkorea.mapper.CompanyCommunityBoardMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("companyCommunityBoardService")
public class CompanyCommunityBoardServiceImpl implements CompanyCommunityBoardService{
	@Autowired
	private CompanyCommunityBoardMapper dao;
	
	@Override
	public ArrayList<CompanyCommunityBoardDTO> companyBoardList() {
		log.info("@# companyCommunityBoardServiceImpl list 구현" );
		
		ArrayList<CompanyCommunityBoardDTO> companyBoardList=dao.companyBoardList();
		
		return companyBoardList;
	}

	@Override
	public void companyBoardWrite(HashMap<String, String> param) {
		log.info("@# CompanyCommunityBoardServiceImpl write 구현");
		
		dao.companyBoardWrite(param);
	}

	@Override
	public CompanyCommunityBoardDTO companyBoardContentView(HashMap<String, String> param) {
		log.info("@# CompanyCommunityBoardServiceImpl content_view 구현단");
		
		CompanyCommunityBoardDTO dto = dao.companyBoardContentView(param);
		
		return dto;
	}
	@Override
	public CompanyCommunityBoardDTO companyBoardModifyView(HashMap<String, String> param) {
		log.info("@# CompanyCommunityBoardServiceImpl modify_view 구현단");
		
		CompanyCommunityBoardDTO dto = dao.companyBoardModifyView(param);
		
		return dto;
	}
	
	

	@Override
	public void companyBoardHit(HashMap<String, String> param) {
		log.info("@#@#@#@#CompanyCommunityBoardNum 작동" );
		
		dao.companyBoardHit(param);
	}
	
	@Override
	public void companyBoardModify(HashMap<String, String> param) {
		log.info("@# CompanyCommunityBoardServiceImpl modify 접근");
		
		dao.companyBoardModify(param);
	}
	
	@Override
	public void companyBoardDelete(HashMap<String, String> param) {
		log.info("@# CompanyCommunityBoardServiceImpl delete 구현");
		
		dao.companyBoardDelete(param);
	}

	

	
}







