package com.jjobkorea.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jjobkorea.dto.JobseekerBoardDTO;

//실행시 매퍼파일을 읽어 들이도록 지정
@Mapper
public interface JobseekerBoardMapper {
	public ArrayList<JobseekerBoardDTO> jobseekerList();
	public void jobseekerWrite(JobseekerBoardDTO boardDTO);
	public JobseekerBoardDTO jobseekerContentView(HashMap<String, String> param);
	public void jobseekerModify(HashMap<String, String> param);
	public void jobseekerDelete(HashMap<String, String> param);
	public void jobseekerHit(int jobseekerCommunityBoardNum);
	
	public boolean hasLiked(HashMap<String, String> param);
    public void updateLikeStatus(HashMap<String, String> param);
    public int getLikeCount(int jobseekerCommunityBoardNum);
	public void updateLikeCount(HashMap<String, String> param);
	
}