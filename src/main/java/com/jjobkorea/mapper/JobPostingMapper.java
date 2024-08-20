package com.jjobkorea.mapper;

import java.util.HashMap;
import java.util.List;

import com.jjobkorea.dto.CompanyDTO;
import com.jjobkorea.dto.FilterDTO;
import com.jjobkorea.dto.JobPostingDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface JobPostingMapper {

    // 메인 페이지 진입시 채용 정보 리스트 가져오기
    public List<JobPostingDTO> getPostingListToMain();

    // 채용 공고 페이지 진입시 리스트 가져오기
    public List<JobPostingDTO> getPostingList(int pageNum);

    // 선택조건 리스트 가져오기
    public List<JobPostingDTO> getSearchList(@Param("filter") FilterDTO dto, @Param("pageNum") int pageNum);

    // 기업 정보 가져오기
//    public CompanyDTO getCompanyInfo(int companyId);

    // 채용 정보 가져오기
//    public JobPostingDTO getJobPosting(int id);
    

    public JobPostingDTO view_jobPosting(HashMap<String, String> param);

    // 채용공고등록
    public void addpostingwrite(JobPostingDTO jobPostingDTO);

    // 채용공고에 대한 이미지 파일 등록
    public void insertFile(JobPostingDTO postingImageDTO);
    
    // 채용공고에 연결된 이미지 파일들 가져오기
//    public List<JobPostingDTO> getFilesByPostingId(int id);
}
