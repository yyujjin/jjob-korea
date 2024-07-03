package com.jjobkorea.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.CompanyCommunityBoardDTO;
import com.jjobkorea.dto.Criteria;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface PageDAO {
//	Criteria 객체를 이용해서 페이징 처리
	public ArrayList<CompanyCommunityBoardDTO> listWithPaging(Criteria cri);
//	public int getTotalCount();
	public int getTotalCount(Criteria cri);
}
















