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
	

	public int getLikeCount(int jobseekerCommunityBoardNum); // 좋아요 수 카운트
    public void likeOrUnlike(HashMap<String, String> param); // 좋아요:1 / 취소:0
	public boolean hasLiked(HashMap<String, String> param); // 좋아요 여부 확인
	public void updateLikeCount(HashMap<String, String> param); // 좋아요 수 저장

}

