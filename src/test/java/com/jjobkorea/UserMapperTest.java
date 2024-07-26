package com.jjobkorea;

import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.mapper.UserMapper;


import org.junit.jupiter.api.Test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.test.util.AssertionErrors.assertNotNull;


@SpringBootTest
public class UserMapperTest {

    private static final Logger log = LoggerFactory.getLogger(UserMapperTest.class);

    @Autowired
    private UserMapper userMapper;

    @Test
    public void 로그인_성공() {

        UserDTO userDTO = new UserDTO();
        userDTO.setUserId("abcd");
        userDTO.setPassword("1234");
        String userName = userMapper.findUsernameByLoginInfo(userDTO);
        assertNotNull(userName,"유저 이름이 null이 아니어야 합니다.");
        log.info("로그인 성공, 유저네임 : {}",userName);
    }

    @Test
    public void 로그인실패_아이디_불일치() {

        UserDTO userDTO = new UserDTO();
        userDTO.setUserId("aaa");
        userDTO.setPassword("1234");
        String userName = userMapper.findUsernameByLoginInfo(userDTO);
        assertNull(userName,"유저 이름이 null이어야 합니다.");
    }

    @Test
    public void 로그인실패_비밀번호_불일치() {

        UserDTO userDTO = new UserDTO();
        userDTO.setUserId("abcd");
        userDTO.setPassword("1111");
        String userName = userMapper.findUsernameByLoginInfo(userDTO);
        assertNull(userName,"유저 이름이 null이어야 합니다.");
    }
}