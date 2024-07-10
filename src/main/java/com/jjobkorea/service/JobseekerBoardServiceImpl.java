package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.mapper.JobseekerBoardAttachMapper;
import com.jjobkorea.mapper.JobseekerBoardMapper;
import com.jjobkorea.dto.JobseekerBoardAttachDTO;
import com.jjobkorea.dto.JobseekerBoardDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("jobseekerBoardService")
public class JobseekerBoardServiceImpl implements JobseekerBoardService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<JobseekerBoardDTO> jobseekerBoardList() {
		log.info("@# BoardServiceImpl list");
		
		JobseekerBoardMapper dao = sqlSession.getMapper(JobseekerBoardMapper.class);
		ArrayList<JobseekerBoardDTO> jobseekerList=dao.jobseekerList();
		
		return jobseekerList;
	}

	@Override
//	public void write(HashMap<String, String> param) {
//	파일업로드는 파라미터를 DTO 사용
	public void jobseekerWrite(JobseekerBoardDTO boardDTO) {
		
		log.info("@# BoardServiceImpl write");
		
		JobseekerBoardMapper dao = sqlSession.getMapper(JobseekerBoardMapper.class);
		JobseekerBoardAttachMapper adao = sqlSession.getMapper(JobseekerBoardAttachMapper.class);
//		dao.write(param);
		dao.jobseekerWrite(boardDTO);
		log.info("@# boardDTO=>"+boardDTO);
		
//		첨부파일 있는지 체크
		log.info("@# boardDTO.getAttachList()=>"+boardDTO.getAttachList());
		if (boardDTO.getAttachList() == null || boardDTO.getAttachList().size() == 0) {
			log.info("@# null");
			return;
		}
		
//		첨부파일이 있는 경우 처리
		boardDTO.getAttachList().forEach(attach -> {
			attach.setJobseekerCommunityBoardNum
		 (boardDTO.getJobseekerCommunityBoardNum());
			adao.insertFile(attach);
		});
	}

	@Override
	public JobseekerBoardDTO jobseekerContentView(HashMap<String, String> param) {
		log.info("@# BoardServiceImpl content_view");
		
		JobseekerBoardMapper dao = sqlSession.getMapper(JobseekerBoardMapper.class);
		JobseekerBoardDTO dto = dao.jobseekerContentView(param);
		
		return dto;
	}

	@Override
	public void jobseekerModify(HashMap<String, String> param) {
		log.info("@# BoardServiceImpl modify");
		
		JobseekerBoardMapper dao = sqlSession.getMapper(JobseekerBoardMapper.class);
		dao.jobseekerModify(param);
	}

	@Override
	public void jobseekerDelete(HashMap<String, String> param) {
		log.info("@# BoardServiceImpl delete");
		log.info("@# param=>"+param);
		
		JobseekerBoardMapper dao = sqlSession.getMapper(JobseekerBoardMapper.class);
		JobseekerBoardAttachMapper attachDAO = sqlSession.getMapper(JobseekerBoardAttachMapper.class);
		
		attachDAO.deleteFile(param.get("jobseekerCommunityBoardNum"));
		dao.jobseekerDelete(param);
	}
	
    @Override
    public void jobseekerHit(int jobseekerCommunityBoardNum) {
        log.info("@# BoardServiceImpl hit");

        JobseekerBoardMapper dao = sqlSession.getMapper(JobseekerBoardMapper.class);
        dao.jobseekerHit(jobseekerCommunityBoardNum);
    }

}
