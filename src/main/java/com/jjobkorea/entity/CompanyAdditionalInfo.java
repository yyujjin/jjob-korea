package com.jjobkorea.entity;

import lombok.Data;
import jakarta.persistence.*;

@Entity
@Data
public class CompanyAdditionalInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long additionalInfoId;

    private Long companyId;
    private String establishment;
    private Integer companySize;
    private String businessSector;
    private String keyProducts;
    private String recruitment;
    private String companyHistory;
    private Long sizeTypeId; // 추가된 컬럼
}
