package com.tmi.spring.tourism.controller;

import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tmi.spring.tourism.model.service.TourismService;
import com.tmi.spring.tourism.tourdata.areacode.AreaCodeItem;
import com.tmi.spring.tourism.tourdata.areacode.AreaCodeBody;
import com.tmi.spring.tourism.tourdata.areacode.AreaCodeData;

import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @생성 전인찬
 * @작업 전인찬
 *
 */

@Controller
@Slf4j
@RequestMapping("/tourism")
public class TourismController {
	
	@Autowired
	TourismService tourismService;
	
	final String AREACODE_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode";
	final String CATEGORYCODE_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode";
	final String AREABASEDLIST_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList";
	final String SEARCHKEYWORD_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword";
	final String LOCATIONBASEDLIST_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList";
	final String SEARCHFESTIVAL_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival";
	final String SEARCHCOURSE_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/searchCourse";
	final String SEARCHSTAY_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay";
	final String DETAILINTRO_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro";
	final String DETAILINFO_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo";
	final String DETAILIMAGE_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage";
	final String DETAILCOMMON_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon";
	final String SERVICE_KEY = "WJrWhTS5sO0umKspB%2F6l3eIML4y24JazyOw7uenJR%2F%2FnZ6LQfNHV09G8L47Al%2BdjLJIxbskdBRU6Rx8qwkJWoQ%3D%3D";
	final String LAST_URL = "&MobileOS=ETC&MobileApp=AppTest";
	
	@GetMapping("/")
	public void index() {
		log.info("GET / 요청!");
	}
	
	@GetMapping("/areaCode.do")
	public ResponseEntity<?> areaCode(){
		String url = AREACODE_URL + "?ServiceKey=" + SERVICE_KEY + LAST_URL;
		AreaCodeData areacodedata = tourismService.getAreaCode(url);
		log.debug("areacodedata = {}", areacodedata);
		List<AreaCodeItem> areacode = areacodedata.getAreacodebody().getAreacode();
		areacode.sort(new Comparator<AreaCodeItem>() {

			@Override
			public int compare(AreaCodeItem o1, AreaCodeItem o2) {
				return o1.getRnum() - o2.getRnum();
			}
		});
		return ResponseEntity.ok(areacode);
	}
	
//	@GetMapping("/areaCodes.do")
//	public ResponseEntity<?> areaCodes(){
//		String AREACODES = ;
//		String url = AREACODE_URL + "?ServiceKey=" + SERVICE_KEY + "areaCode=" + AREACODES + LAST_URL;
//		AreaCodeData areacodedata = tourismService.getAreaCode(url);
//		log.debug("areacodedata = {}", areacodedata);
//		List<AreaCode> areacode = areacodedata.getAreacodebody().getAreacode();
//		areacode.sort(new Comparator<AreaCode>() {
//
//			@Override
//			public int compare(AreaCode o1, AreaCode o2) {
//				return o1.getRnum() - o2.getRnum();
//			}
//		});
//		return ResponseEntity.ok(areacode);
//	}
	
	
//	@GetMapping("/categoryCode.do")
//	public ResponseEntity<?> categoryCode(){
//		String url = CATEGORYCODE_URL + "?ServiceKey=" + SERVICE_KEY + LAST_URL;
//		CategoryCodeData categorycodedata = tourismService.getCategoryCode(url);
//		log.debug("categorycodedata = {}", categorycodedata);
//		List<CategoryCode> categorycode = categorycodedata.getCategorycodebody().getCategorycode();
//		categorycode.sort(new Comparator<CategoryCode>() {
//
//			@Override
//			public int compare(CategoryCode o1, CategoryCode o2) {
//				return o1.getRnum() - o2.getRnum();
//			}
//		});
//		return ResponseEntity.ok(categorycode);
//	}
	
	
	
}
