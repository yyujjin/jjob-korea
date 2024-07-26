package com.jjobkorea.service;

import com.jjobkorea.dto.UserDTO;

public interface UserService {
    //로그인
    public String findUsernameByLoginInfo(UserDTO userDTO);
}
