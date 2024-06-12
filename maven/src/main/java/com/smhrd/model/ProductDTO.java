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
	// 제철
	private String time_production;
	// 손질법
	private String trimming;
	// 레시피 
	private String recipe;
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
