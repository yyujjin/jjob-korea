package com.jjobkorea.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.LoginDTO;

@Mapper
public interface LoginMapper {

	public void insertLogin(LoginDTO dto);
	
}
