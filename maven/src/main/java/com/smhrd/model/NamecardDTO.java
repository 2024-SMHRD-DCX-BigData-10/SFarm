package com.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor

@Getter

public class NamecardDTO {
	  // 명함 식별자 
    private Double card_idx;
    // 농가 식별자 
    private Double fh_idx;
    // 포스터 식별자 
    private Double poster_idx;
    // 명함 소개 
    private String card_info;

}
