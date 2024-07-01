package com.jjobkorea.mapper.user;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.user.JoinDTO;

@Mapper
public interface JoinMapper {

	public void insertJoin(JoinDTO dto);
}
