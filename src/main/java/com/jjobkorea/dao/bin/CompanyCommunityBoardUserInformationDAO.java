package com.jjobkorea.dao.bin;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.bin.CompanyCommunityBoardUserInformationDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface CompanyCommunityBoardUserInformationDAO {
	public ArrayList<CompanyCommunityBoardUserInformationDTO> list();
}
















