package com.jjobkorea.entity;

import lombok.Data;
import jakarta.persistence.*;

@Entity
@Data
public class CompanySizeType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long sizeTypeId;

    private String sizeTypeName;
}
