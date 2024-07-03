package com.jjobkorea.service;

import java.util.ArrayList;

import com.jjobkorea.dto.CompanyCommunityBoardDTO;
import com.jjobkorea.dto.Criteria;

public interface PageService {
	public ArrayList<CompanyCommunityBoardDTO> listWithPaging(Criteria cri);
//	public int getTotalCount();
	public int getTotalCount(Criteria cri);
}
