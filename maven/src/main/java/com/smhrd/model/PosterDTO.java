package com.smhrd.model;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor

@Getter

public class PosterDTO {


    // 포스터 식별자 
    private Double poster_idx;

    // 농가 식별자 
    private Double fh_idx;

    // 홍보 문구 
    private String poster_contents;

    // 홍보 이미지1 
    private String poster_img1;

    // 홍보 이미지2 
    private String poster_img2;

    // 홍보 이미지3 
    private String poster_img3;

    // 홍보 영상 
    private String poster_video;

}
