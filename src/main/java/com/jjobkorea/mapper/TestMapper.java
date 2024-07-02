package com.jjobkorea.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.TestDTO;

@Mapper
public interface TestMapper {
	public void insertTest(TestDTO dto);
}
