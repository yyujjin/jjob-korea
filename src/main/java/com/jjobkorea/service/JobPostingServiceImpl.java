package com.jjobkorea.service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.dto.FilterDTO;
import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.mapper.JobPostingMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class JobPostingServiceImpl implements JobPostingService {

	@Autowired
	JobPostingMapper jobPostingMapper;

	// 채용 정보 리스트 가져오기
	@Override
	public List<JobPostingDTO> getPostingList() {
		// 채용 정보리스트 가져오기
		List<JobPostingDTO> getPostingList = jobPostingMapper.getPostingList();

		// 현재 날짜 가져오기
		LocalDate currentDate = LocalDate.now();
		log.info("현재시간 : {}  ", currentDate);

		for (JobPostingDTO post : getPostingList) {
			log.info("deadline{} : ", post.getDeadline());

			// 마감일 가져옴
			LocalDate deadline = post.getDeadline();

			// D-day 계산
			long daysUntil = ChronoUnit.DAYS.between(currentDate, deadline);
			// countdownDays DTO에 넣기
			post.setCountdownDays(daysUntil);
			log.info("D-DAY : {} ", post.getCountdownDays());
		}

		return getPostingList;
	}

	
	//조건 검색
	@Override
	public List<JobPostingDTO> getSearchList(List<String> filterList, FilterDTO dto ) {
		log.info("getSearchList 서비스 실행됨!!");
		
		for(String filter : filterList) {
			
			switch (filter) {
			case "프론트엔드" : dto.setFrontEnd(filter); break;
			case "백엔드" : dto.setBackEnd(filter); break;
			case "풀스택" : dto.setFullStack(filter); break;
			case "서울" : dto.setSeoul(filter); break;
			case "부산" : dto.setBusan(filter); break;
			case "대구" : dto.setDaegu(filter); break;
			case "인천" : dto.setDaegu(filter); break;
			case "광주" : dto.setGwangju(filter); break;
			case "대전" : dto.setDaejeon(filter); break;
			case "울산" : dto.setUlsan(filter); break;
			case "세종" : dto.setSejong(filter); break;
			case "대기업" : dto.setLargeCompany(filter); break;
			case "중소기업" : dto.setSmallMediumCompany(filter); break;
			case "스타트업" : dto.setStartup(filter); break;
			case "정규직" : dto.setRegularEmployee(filter); break;
			case "계약직" : dto.setContractEmployee(filter); break;
			case "인턴" : dto.setIntern(filter); break;
			}
		}
		
		
		
		//필터 dto qhsorl 
		List<FilterDTO> searchList = jobPostingMapper.getSearchList(dto);
		log.info("받아온 searchList{} :",  searchList);
		
		return null;
	}

	

}