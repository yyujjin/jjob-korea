package com.jjobkorea.service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.time.temporal.Temporal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.mapper.JobPostingMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class JobPostingServiceImpl implements JobPostingService {

	@Autowired
	JobPostingMapper jobPostringMapper;

	// 채용 정보 리스트 가져오기
	@Override
	public List<JobPostingDTO> getPostingList() {
		// 채용 정보리스트 가져오기
		List<JobPostingDTO> getPostingList = jobPostringMapper.getPostingList();

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

}
