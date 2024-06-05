package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor

@Getter

public class FarmhouseDTO  {
	
	 // 농가 식별자 
    private Double fh_idx;

    // 회원 아이디 
    private String mb_id;

    // 농가 명 
    private String fh_name;

    // 농가 대표자 
    private String fh_owner;

    // 명함 ID 
    private String fh_namecard_id;


	

}
