package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.jjobkorea.dto.JobseekerBoardDTO;

public interface JobseekerBoardService {
	public ArrayList<JobseekerBoardDTO> jobseekerBoardList();
	public void jobseekerWrite(JobseekerBoardDTO boardDTO);
	public JobseekerBoardDTO jobseekerContentView(HashMap<String, String> param);
	public void jobseekerModify(HashMap<String, String> param);
	public void jobseekerDelete(HashMap<String, String> param);
	public void jobseekerHit(int jobseekerCommunityBoardNum);
	
	public void likes(int jobseekerCommunityBoardNum); 
    public int getLikeCount(int jobseekerCommunityBoardNum);
}

