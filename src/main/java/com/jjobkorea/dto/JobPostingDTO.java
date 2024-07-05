package com.jjobkorea.dto;

import lombok.Data;

@Data
public class JobPostingDTO {
    private Long id;
    private String title;
    private String description;
    private Long companyId;
    private String companyName;
    private String companyAddress;
}
