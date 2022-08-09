package com.tmi.spring.tourism.tourdata.detalintro;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailIntroItem {
	
	private String taketime; //여행코스(25) : 코스총소요시간
	private String theme; //여행코스(25) : 코스테마
	private String accomcountleports; //레포츠(28) : 수용인원
	private String chkbabycarriageleports; //레포츠(28) : 유모차대여정보
	private String chkcreditcardleports; //레포츠(28) : 신용카드가능정보
	private String chkpetleports; //레포츠(28) : 애완동물동반가능정보
	private String expagerangeleports; //레포츠(28) : 체험가능연령
	private String infocenterleports; //레포츠(28) : 문의및안내
	private String openperiod; //레포츠(28) : 개장기간
	private String parkingfeeleports; //레포츠(28) : 주차요금
	private String parkingleports; //레포츠(28) : 주차시설
	private String reservation; //레포츠(28) : 예약안내
	private String restdateleports; //레포츠(28) : 쉬는날
	private String scaleleports; //레포츠(28) : 규모
	private String usefeeleports; //레포츠(28) : 입장료
	private String discountinfofestival; //행사공연축제(15) : 할인정보
	private String eventenddate; //행사공연축제(15) : 행사종료일
	private String eventhomepage; //행사공연축제(15) : 행사홈페이지
	private String eventplace; //행사공연축제(15) : 행사장소
	private String eventstartdate; //행사공연축제(15) : 행사시작일
	private String festivalgrade; //행사공연축제(15) : 축제등급
	private String placeinfo; //행사공연축제(15) : 행사장위치안내
	private String playtime; //행사공연축제(15) : 공연시간
	private String program; //행사공연축제(15) : 행사프로그램
	private String spendtimefestival; //행사공연축제(15) : 관람소요시간
	private String sponsor1; //행사공연축제(15) : 주최자정보
	private String sponsor1tel; //행사공연축제(15) : 주최자연락처
	private String sponsor2; //행사공연축제(15) : 주관사정보
	private String sponsor2tel; //행사공연축제(15) : 주관사연락처
	private String subevent; //행사공연축제(15) : 부대행사
	private String usetimefestival; //행사공연축제(15) : 이용요금
	private String distance; //여행코스(25) : 코스총거리
	private String infocentertourcourse; //여행코스(25) : 문의및안내
	private String schedule; //여행코스(25) : 코스일정
	private String publicpc; //숙박(32) : 공용 PC실여부
	private String sauna; //숙박(32) : 사우나실여부
	private String seminar; //숙박(32) : 세미나실여부
	private String sports; //숙박(32) : 스포츠시설여부
	private String refundregulation; //숙박(32) : 환불규정
	private String chkbabycarriageshopping; //쇼핑(38) : 유모차대여정보
	private String chkcreditcardshopping; //쇼핑(38) : 신용카드가능정보
	private String chkpetshopping; //쇼핑(38) : 애완동물동반가능정보
	private String culturecenter; //쇼핑(38) : 문화센터바로가기
	private String fairday; //쇼핑(38) : 장서는날
	private String infocentershopping; //쇼핑(38) : 문의및안내
	private String opendateshopping; //쇼핑(38) : 개장일
	private String opentime; //쇼핑(38) : 영업시간
	private String parkingshopping; //쇼핑(38) : 주차시설
	private String restdateshopping; //쇼핑(38) : 쉬는날
	private String restroom; //쇼핑(38) : 화장실설명
	private String saleitem; //쇼핑(38) : 판매품목
	private String saleitemcost; //쇼핑(38) : 판매품목별가격
	private String scaleshopping; //쇼핑(38) : 규모
	private String shopguide; //쇼핑(38) : 매장안내
	private String chkcreditcardfood; //음식점(39) : 신용카드가능정보
	private String discountinfofood; //음식점(39) : 할인정보
	private String firstmenu; //음식점(39) : 대표메뉴
	private String infocenterfood; //음식점(39) : 문의및안내
	private String kidsfacility; //음식점(39) : 어린이놀이방여부
	private String opendatefood; //음식점(39) : 개업일
	private String opentimefood; //음식점(39) : 영업시간
	private String packing; //음식점(39) : 포장가능
	private String parkingfood; //음식점(39) : 주차시설
	private String reservationfood; //음식점(39) : 예약안내
	private String restdatefood; //음식점(39) : 쉬는날
	private String scalefood; //음식점(39) : 규모
	private String seat; //음식점(39) : 좌석수
	private String smoking; //음식점(39) : 금연/흡연여부
	private String treatmenu; //음식점(39) : 취급메뉴
	private String lcnsno; //음식점(39) : 인허가번호
	private String contentid; //기본정보 : 콘텐츠ID
	private String contenttypeid; //기본정보 : 콘텐츠타입ID
	private String accomcount; //관광지(12) : 수용인원
	private String chkbabycarriage; //관광지(12) : 유모차대여정보
	private String chkcreditcard; //관광지(12) : 신용카드가능정보
	private String chkpet; //관광지(12) : 애완동물동반가능정보
	private String expagerange; //관광지(12) : 체험가능연령
	private String expguide; //관광지(12) : 체험안내
	private String heritage1; //관광지(12) : 세계문화유산유무
	private String heritage2; //관광지(12) : 세계자연유산유무
	private String heritage3; //관광지(12) : 세계기록유산유무
	private String infocenter; //관광지(12) : 문의및안내
	private String opendate; //관광지(12) : 개장일
	private String parking; //관광지(12) : 주차시설
	private String restdate; //관광지(12) : 쉬는날
	private String useseason; //관광지(12) : 이용시기
	private String usetime; //관광지(12) : 이용시간
	private String accomcountculture; //문화시설(14) : 수용인원
	private String chkbabycarriageculture; //문화시설(14) : 유모차대여정보
	private String chkcreditcardculture; //문화시설(14) : 신용카드가능정보
	private String chkpetculture; //문화시설(14) : 애완동물동반가능정보
	private String discountinfo; //문화시설(14) : 할인정보
	private String infocenterculture; //문화시설(14) : 문의및안내
	private String parkingculture; //문화시설(14) : 주차시설
	private String parkingfee; //문화시설(14) : 주차요금
	private String restdateculture; //문화시설(14) : 쉬는날
	private String usefee; //문화시설(14) : 이용요금
	private String usetimeculture; //문화시설(14) : 이용시간
	private String scale; //문화시설(14) : 규모
	private String spendtime; //문화시설(14) : 관람소요시간
	private String agelimit; //행사공연축제(15) : 관람가능연령
	private String bookingplace; //행사공연축제(15) : 예매처
	private String usetimeleports; //레포츠(28) : 이용시간
	private String accomcountlodging; //숙박(32) : 수용가능인원
	private String benikia; //숙박(32) : 베니키아여부
	private String checkintime; //숙박(32) : 입실시간
	private String checkouttime; //숙박(32) : 퇴실시간
	private String chkcooking; //숙박(32) : 객실내취사여부
	private String foodplace; //숙박(32) : 식음료장
	private String goodstay; //숙박(32) : 굿스테이여부
	private String hanok; //숙박(32) : 한옥여부
	private String infocenterlodging; //숙박(32) : 문의및안내
	private String parkinglodging; //숙박(32) : 주차시설
	private String pickup; //숙박(32) : 픽업서비스
	private String roomcount; //숙박(32) : 객실수
	private String reservationlodging; //숙박(32) : 예약안내
	private String reservationurl; //숙박(32) : 예약안내홈페이지
	private String roomtype; //숙박(32) : 객실유형
	private String scalelodging; //숙박(32) : 규모
	private String subfacility; //숙박(32) : 부대시설 (기타)
	private String barbecue; //숙박(32) : 바비큐장여부
	private String beauty; //숙박(32) : 뷰티시설정보
	private String beverage; //숙박(32) : 식음료장여부
	private String bicycle; //숙박(32) : 자전거대여여부
	private String campfire; //숙박(32) : 캠프파이어여부
	private String fitness; //숙박(32) : 휘트니스센터여부
	private String karaoke; //숙박(32) : 노래방여부
	private String publicbath; //숙박(32) : 공용샤워실여부

}
