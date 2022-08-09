package com.tmi.spring.tourism.tourdata.searchfestival;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchFestivalItem {

	private String addr1; //주소
	private String addr2; //상세주소
	private String areacode; //지역코드
	private String booktour; //교과서속여행지 여부
	private String cat1; //대분류
	private String cat2; //중분류
	private String cat3; //소분류
	private String contentid; //콘텐츠ID
	private String contenttypeid; //콘텐츠타입ID
	private String createdtime; //등록일
	private String eventstartdate; //행사시작일(형식 : YYYYMMDD)
	private String eventenddate; //행사종료일(형식 : YYYYMMDD)
	private String firstimage; //대표이미지(원본)
	private String firstimage2; //대표이미지(썸네일)
	private String mapx; //GPS X좌표
	private String mapy; //GPS Y좌표
	private String mlevel; //Map Level
	private String modifiedtime; //수정일
	private String readcount; //조회수
	private String sigungucode; //시군구코드
	private String tel; //전화번호
	private String title; //제목
	
}