package com.jjobkorea;

import java.util.List;

import org.junit.jupiter.api.Test;

//import java.util.List;

//import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.jjobkorea.dto.JobPostringDTO;
import com.jjobkorea.mapper.JobPostringMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class MapperTests {
	
	
	@Autowired
	private JobPostringMapper jobPostringMapper;

//	
//	@Autowired
//	private TestMapper testMapper;
//	
//	@Autowired
//	private CompanyCommunityBoardMapper mapper;
//
//
//	@Test
//	public void test() {
//		TestDTO dto= new TestDTO();
//		//중복안됨
//		//duplication~ 뭐라뭐라하면 아이디 중복돼서 그런거니 db에 없는 번호 넣으면 됨. 
//		dto.setId(55);
//		testMapper.insertTest(dto);
//		System.out.println("실행완료!");
//	}
//
//	
//	
//	@Test
//	public void test1() {
//		CompanyCommunityBoardDTO dto = new CompanyCommunityBoardDTO();
//		
//		dto.setCompanyCommunityBoardContent("Dd");
//		dto.setCompanyCommunityBoardDate(null);
//		dto.setCompanyCommunityBoardHit(333);
//		dto.setCompanyCommunityBoardTitle("ddd");
//		dto.setCompanyCommunityBoardNum(555);
//		List<CompanyCommunityBoardDTO> boardList = mapper.list();
//		for (CompanyCommunityBoardDTO board : boardList) {
//			System.out.println("=========================");
//			System.out.println(board.getCompanyCommunityBoardContent());
//			System.out.println(board.getCompanyCommunityBoardHit());
//			System.out.println(board.getCompanyUserName());
//			System.out.println("=========================");
//		}
//	}
//	

//}
	
	
	
	//채용 정보 리스트 select 테스트 
	@Test
	public void selectListTest() {
		
			List<JobPostringDTO> postingList = jobPostringMapper.getList();
			
				for (JobPostringDTO posting : postingList) {
					log.info("=========================");
					log.info("id :{} ", posting.getId());
					log.info("CompanyName :{} ", posting.getCompanyName());
					log.info("PostingImage :{} ", posting.getPostingImage());
					log.info("PostingTitle : {}", posting.getPostingTitle());
					log.info("Hit :{} ", posting.getHit());
					log.info("=========================");
					
				}
			}
		
	}

