package com.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor

@Getter

public class CertificationDTO {

	// 인증 식별자 
    private Double cert_idx;

    // 농가 식별자 
    private String fh_name;
    // 인증종류 
    private String cert_type;
    // 이미지
    private String cert_img;
    // 인증번호 
    private String cert_num;
    // 인증기간 
    private String cert_period;
    // 인증여부 
    private String cert_yn;
    // 인증기관 
    private String cert_org;
    // 인증일자 
    private Date certified_at;
	
}
