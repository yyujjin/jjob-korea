package com.jjobkorea.dto;

import lombok.Getter;
import lombok.Setter;

public class TestDTO {

@Getter
@Setter
private int id;
private String name;



@Override
public String toString() {
	return "TestDTO [id=" + id + ", name=" + name + "]";
}




	
	

}
