package com.jjobkorea.mapper;

import com.jjobkorea.dto.UserDTO;

public interface UserMapper {
    //아이디, 비번이 일치하면 유저의 이름을 가져오는 기능
    public String findUsernameByLoginInfo(UserDTO userDTO);
}
