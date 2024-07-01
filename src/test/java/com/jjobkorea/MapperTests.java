package com.jjobkorea;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.jjobkorea.dto.LoginDTO;
import com.jjobkorea.mapper.LoginMapper;

@SpringBootTest
class MapperTests {

	@Autowired
	private LoginMapper loginMapper;

	@Test
	public void testOfInsert() {
		LoginDTO params = new LoginDTO();
//		params.setId(1);
		params.setUserId("피카츄");
		params.setPassWord("1234");

		loginMapper.insertLogin(params);
		System.out.println("실행완료!");
	}

}
