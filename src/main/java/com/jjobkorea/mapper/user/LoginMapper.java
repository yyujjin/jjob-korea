package com.jjobkorea.mapper.user;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.user.LoginDTO;

@Mapper
public interface LoginMapper {

	public void insertLogin(LoginDTO dto);
	
}
