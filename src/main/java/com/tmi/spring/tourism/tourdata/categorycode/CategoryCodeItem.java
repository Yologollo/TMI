package com.tmi.spring.tourism.tourdata.categorycode;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryCodeItem {
	private int code; // 코드 : 대,중,소분류코드
	private String name; // 코드명 : 대,중,소분류코드명
	private int rnum; // 일련번호
}
