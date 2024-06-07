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

public class ProductDTO {
	// 농산품 식별자
	private Double agri_idx;
	// 농산품 명
	@NonNull private String agri_name;
	// 영양성분
	private String nutrition_fact;
	// 손질법
	private String trimming;
	// 보관법
	private String keeping;
	// 효능
	private String effect;
	// 구입요령
	private String purchase_method;
	// 사진1
	private String agri_img1;
	// 사진2
	private String agri_img2;
	// 사진3
	private String agri_img3;

}
