package com.jjobkorea.dto;

import lombok.Data;

@Data
public class JobPostringDTO {

	private int id;
	private String companyName;
	private String postingImage;
	private String postingTitle;
	private int hit;
}
