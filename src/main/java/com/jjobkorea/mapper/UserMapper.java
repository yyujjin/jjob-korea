package com.jjobkorea.mapper;

import com.jjobkorea.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    //아이디, 비번이 일치하면 유저의 이름을 가져오는 기능
    public UserDTO login(UserDTO userDTO);
}
