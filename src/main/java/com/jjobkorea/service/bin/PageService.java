package com.jjobkorea.service.bin;

import java.util.ArrayList;

import com.jjobkorea.dto.bin.CompanyCommunityBoardDTO;
import com.jjobkorea.dto.bin.Criteria;

public interface PageService {
	public ArrayList<CompanyCommunityBoardDTO> listWithPaging(Criteria cri);
//	public int getTotalCount();
	public int getTotalCount(Criteria cri);
}
