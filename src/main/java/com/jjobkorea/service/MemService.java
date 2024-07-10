package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Select;

import com.jjobkorea.dto.MemDTO;

public interface MemService {
    public ArrayList<MemDTO> loginYn(HashMap<String, String> param);
    public ArrayList<MemDTO> selectByCpId(HashMap<String, String> param);
    public void write(HashMap<String, String> param);
    public int checkCpRegistrationNum(String cpRegistrationNum);
    
  
}
