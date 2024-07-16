package com.jjobkorea.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.sql.Timestamp;

@Entity
@Table(name = "signup_tb")
@Data
public class SignupTb {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "memId", nullable = false, unique = true)
    private String memId;

    @Column(name = "memPwd", nullable = false)
    private String memPwd;

    @Column(name = "memName", nullable = false)
    private String memName;

    @Column(name = "memPhone", nullable = false)
    private String memPhone;

    @Column(name = "memAddr", nullable = false)
    private String memAddr;

    @Column(name = "memEmail", nullable = false)
    private String memEmail;

    @Column(name = "memBirth")
    private String memBirth;

    @Column(name = "memGender")
    private String memGender;

    @Column(name = "memCreationDate")
    private Timestamp memCreationDate;

    @Column(name = "cpId")
    private Long cpId;
}
