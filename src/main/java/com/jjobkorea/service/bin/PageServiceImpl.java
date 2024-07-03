package com.jjobkorea.service.bin;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.dao.bin.PageDAO;
import com.jjobkorea.dto.bin.CompanyCommunityBoardDTO;
import com.jjobkorea.dto.bin.Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("PageService")
public class PageServiceImpl implements PageService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<CompanyCommunityBoardDTO> listWithPaging(Criteria cri) {
		log.info("@# PageServiceImpl listWithPaging");
		log.info("@# cri=>"+cri);
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
		ArrayList<CompanyCommunityBoardDTO> list=dao.listWithPaging(cri);
		
		return list;
	}

	@Override
//	public int getTotalCount() {
	public int getTotalCount(Criteria cri) {
		log.info("@# PageServiceImpl getTotalCount");
		
		PageDAO dao = sqlSession.getMapper(PageDAO.class);
//		int total=dao.getTotalCount();
		int total=dao.getTotalCount(cri);
		
		return total;
	}

}







