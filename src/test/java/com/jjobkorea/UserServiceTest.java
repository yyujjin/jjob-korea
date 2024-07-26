package com.jjobkorea;

import com.jjobkorea.dto.UserDTO;
import com.jjobkorea.service.UserService;
import com.jjobkorea.service.UserServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
public class UserServiceTest {

    @Autowired
    private UserServiceImpl userService;

    @Test
    public void 로그인_성공시_유저이름_조회 () {

        UserDTO userDTO = new UserDTO();
        userDTO.setUserId("abcd");
        userDTO.setPassword("1234");

        String findUsernameByLoginInfo = userService.findUsernameByLoginInfo(userDTO);

        assertEquals("세일러문", findUsernameByLoginInfo, "사용자 이름이 일치하지 않습니다.");

    }
}