package com.jjobkorea;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.jjobkorea.dto.user.JoinDTO;
import com.jjobkorea.dto.user.LoginDTO;
import com.jjobkorea.mapper.user.JoinMapper;
import com.jjobkorea.mapper.user.LoginMapper;

@SpringBootTest
class MapperTests {

	@Autowired
	private LoginMapper loginMapper;
	
	@Autowired
	private JoinMapper joinMapper;

//	@Test
//	public void testOfInsert() {
//		LoginDTO params = new LoginDTO();
////		params.setId(1);
//		params.setUserId("피카츄");
//		params.setPassWord("1234");
//
//		loginMapper.insertLogin(params);
//		System.out.println("실행완료!");
//	}
	
	@Test
	public void testOfInsert2() {
		JoinDTO params = new JoinDTO();
		params.setId(5);
		params.setUserId("피카츄");
		params.setPassWord("1234");

		joinMapper.insertJoin(params);
		System.out.println("실행완료!");
	}

}
