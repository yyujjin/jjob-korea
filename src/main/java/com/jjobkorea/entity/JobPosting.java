package com.jjobkorea.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "job_posting_table")
@Data
public class JobPosting {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cp_id", referencedColumnName = "cp_id", nullable = false)
    private Company company;

    @Column(name = "admin_id", length = 50, nullable = false)
    private String adminId;

    @Column(name = "cp_name")
    private String cpName; // 새로 추가한 cp_name 컬럼
    
    @Column(name = "job_title", length = 255, nullable = false)
    private String jobTitle;

    @Column(name = "job_detail", length = 255, nullable = false)
    private String jobDetail;

    @Column(name = "job_type", length = 255, nullable = false)
    private String jobType;

    @Column(name = "job_location", length = 255, nullable = false)
    private String jobLocation;

    @Column(name = "start_date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date startDate;

    @Column(name = "end_date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;
}
