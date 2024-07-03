package com.jjobkorea.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "company_table")
@Data
public class Company {

    @Id
    @Column(name = "cp_id", length = 50)
    private String cpId;

    @Column(name = "admin_id", length = 50, nullable = false)
    private String adminId;

    @Column(name = "cp_name", length = 255, nullable = false)
    private String cpName;

    @Column(name = "cp_logo", length = 255)
    private String cpLogo;

    @Column(name = "ceo_name", length = 255, nullable = false)
    private String ceoName;

    @Column(name = "cp_img", length = 255)
    private String cpImg;

    @Column(name = "cp_tel", length = 255, nullable = false)
    private String cpTel;

    @Column(name = "cp_address", length = 255, nullable = false)
    private String cpAddress;

    @Column(name = "cp_email", length = 255, nullable = false)
    private String cpEmail;

    @Column(name = "cp_type", length = 255, nullable = false)
    private String cpType;

    @Column(name = "reg_date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date regDate;
}
