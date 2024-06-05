package com.smhrd.model;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@Getter

public class MemberDTO {
	
	
    // 회원 아이디 
   @NonNull private String mb_id;

    // 회원 비밀번호 
   @NonNull private String mb_pw;

    // 회원 이름 
    private String mb_name;

    // 회원 연락처 
    private String mb_phone;

    // 회원 농가정보 
    private String mb_farmhouse_info;

    // 회원 가입일자 
    private Date joined_at;

    // 회원 구분 
    private String mb_type;
}
