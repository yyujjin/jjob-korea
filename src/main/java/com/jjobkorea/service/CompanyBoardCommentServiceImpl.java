package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.dto.CompanyBoardCommentDTO;
import com.jjobkorea.mapper.CompanyBoardCommentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("CompanyBoardCommentService")
public class CompanyBoardCommentServiceImpl implements CompanyBoardCommentService{
	@Autowired
	private CompanyBoardCommentMapper dao;

	@Override
	public void save(HashMap<String, String> param) {
		log.info("@# CompanyBoardCommentServiceImpl save");
		
		dao.save(param);
	}

	@Override
	public ArrayList<CompanyBoardCommentDTO> allFind(HashMap<String, String> param) {
		log.info("@# CompanyBoardCommentServiceImpl allFind");
		
		ArrayList<CompanyBoardCommentDTO> list = dao.allFind(param);
		log.info("@#list ===> "+list);
		
		return list;
	}

}







