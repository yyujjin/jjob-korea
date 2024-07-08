package com.jjobkorea.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.MemDTO;

@Mapper
public interface MemMapper {
    public ArrayList<MemDTO> loginYn(HashMap<String, String> param);
    public ArrayList<MemDTO> selectByCpId(HashMap<String, String> param);
    public void write(HashMap<String, String> param);
    public int checkCpRegistrationNum(String cpRegistrationNum);
    
}
