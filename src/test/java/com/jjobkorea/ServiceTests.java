package com.jjobkorea;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.jjobkorea.dto.JobPostingDTO;
import com.jjobkorea.service.JobPostingService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class ServiceTests {

//    @Autowired
//    private JobPostingService jobPostingService;
//
//    @Test
//    public void getListTest() {
//
//        List<JobPostingDTO> postingList = jobPostingService.getPostingList();
//
//
//        for (JobPostingDTO posting : postingList) {
//            log.info("=========================");
//            log.info("id :{} ", posting.getId());
//            log.info("CompanyName :{} ", posting.getCompanyName());
//            log.info("PostingImage :{} ", posting.getPostingImage());
//            log.info("PostingTitle : {}", posting.getPostingTitle());
//            log.info("Hit :{} ", posting.getHit());
//            log.info("=========================");
//
//        }
//    }


}
