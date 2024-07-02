package com.jjobkorea;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.jjobkorea.dto.TestDTO;
import com.jjobkorea.mapper.TestMapper;


@SpringBootTest
class MapperTests {

	
	@Autowired
	private TestMapper testMapper;


	@Test
	public void test() {
		TestDTO dto= new TestDTO();
		//중복안됨
		//duplication~ 뭐라뭐라하면 아이디 중복돼서 그런거니 db에 없는 번호 넣으면 됨. 
		dto.setId(0);
		testMapper.insertTest(dto);
		System.out.println("실행완료!");
	}

}
