package com.jjobkorea;

import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.mapper.UserMapper;


import org.junit.jupiter.api.Test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
public class UserMapperTest {

    private static final Logger log = LoggerFactory.getLogger(UserMapperTest.class);

    @Autowired
    private UserMapper userMapper;

    @Test
    public void checkUser() {

        UserDTO userDTO = new UserDTO();
        userDTO.setUserId("abcd");
        userDTO.setPassword("1234");
        String userName = userMapper.findUsernameByLoginInfo(userDTO);
        log.info("로그인 성공, 유저네임 : {}",userName);
    }
}
