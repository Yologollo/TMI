package com.tmi.spring.tourism.tourdata.detailinfo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailInfoItem {
	
	private String contentid; //기본정보 : 콘텐츠ID
	private String contenttypeid; //기본정보 : 콘텐츠타입ID
	private String fldgubun; //숙박/여행코스제외타입 : 일련번호
	private String infoname; //숙박/여행코스제외타입 : 제목
	private String infotext; //숙박/여행코스제외타입 : 내용
	private String serialnum; //숙박/여행코스제외타입 : 반복일련번호
	private String subcontentid; //여행코스(25) : 하위콘텐츠ID
	private String subdetailalt; //여행코스(25) : 코스이미지설명
	private String subdetailimg; //여행코스(25) : 코스이미지
	private String subdetailoverview; //여행코스(25) : 코스개요
	private String subname; //여행코스(25) : 코스명
	private String subnum; //여행코스(25) : 반복일련번호
	private String roomcode; //숙박(32) : 객실코드
	private String roomtitle; //숙박(32) : 객실명칭
	private String roomsize1; //숙박(32) : 객실크기(평)
	private String roomcount; //숙박(32) : 객실수
	private String roombasecount; //숙박(32) : 기준인원
	private String roommaxcount; //숙박(32) : 최대인원
	private String roomoffseasonminfee1; //숙박(32) : 비수기주중최소
	private String roomoffseasonminfee2; //숙박(32) : 비수기주말최소
	private String roompeakseasonminfee1; //숙박(32) : 성수기주중최소
	private String roompeakseasonminfee2; //숙박(32) : 성수기주말최소
	private String roomintro; //숙박(32) : 객실소개
	private String roombathfacility; //숙박(32) : 목욕시설여부
	private String roombath; //숙박(32) : 욕조여부
	private String roomhometheater; //숙박(32) : 홈시어터여부
	private String roomaircondition; //숙박(32) : 에어컨여부
	private String roomtv; //숙박(32) : TV 여부
	private String roompc; //숙박(32) : PC 여부
	private String roomcable; //숙박(32) : 케이블설치여부
	private String roominternet; //숙박(32) : 인터넷여부
	private String roomrefrigerator; //숙박(32) : 냉장고여부
	private String roomtoiletries; //숙박(32) : 세면도구여부
	private String roomsofa; //숙박(32) : 소파여부
	private String roomcook; //숙박(32) : 취사용품여부
	private String roomtable; //숙박(32) : 테이블여부
	private String roomhairdryer; //숙박(32) : 드라이기여부
	private String roomsize2; //숙박(32) : 객실크기(평방미터)
	private String roomimg1; //숙박(32) : 객실사진1
	private String roomimg1alt; //숙박(32) : 객실사진1 설명
	private String roomimg2; //숙박(32) : 객실사진2
	private String roomimg2alt; //숙박(32) : 객실사진2 설명
	private String roomimg3; //숙박(32) : 객실사진3
	private String roomimg3alt; //숙박(32) : 객실사진3 설명
	private String roomimg4; //숙박(32) : 객실사진4
	private String roomimg4alt; //숙박(32) : 객실사진4 설명
	private String roomimg5; //숙박(32) : 객실사진5
	private String roomimg5alt; //숙박(32) : 객실사진5 설명

}
