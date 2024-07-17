package com.jjobkorea.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.jjobkorea.dto.ResumeWritePageDTO;

public interface ResumeWritePageService {
    List<ResumeWritePageDTO> getAllResumes();

    void insertResume(ResumeWritePageDTO resume);
}
