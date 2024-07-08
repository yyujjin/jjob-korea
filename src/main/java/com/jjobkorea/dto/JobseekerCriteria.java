package com.jjobkorea.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
//@NoArgsConstructor
public class JobseekerCriteria {
	private int pageNum;//페이지 번호
	private int amount;//페이지당 글 갯수
	
	private String type;
	private String keyword;
	
	public JobseekerCriteria() {
		this(1, 10);
	}
	
	public JobseekerCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
