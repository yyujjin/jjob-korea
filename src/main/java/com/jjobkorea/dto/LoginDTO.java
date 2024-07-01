package com.jjobkorea.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginDTO {

	private int id;
	private String userId;
	private String passWord;
	
	
	@Override
	public String toString() {
		return "LoginDTO [id=" + id + ", userId=" + userId + ", passWord=" + passWord + "]";
	}
	
}
