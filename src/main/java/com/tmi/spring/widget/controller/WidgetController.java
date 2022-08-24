package com.tmi.spring.widget.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tmi.spring.common.HelloSpringUtils;
import com.tmi.spring.widget.data.Item;
import com.tmi.spring.widget.data.Response;
import com.tmi.spring.widget.model.service.WidgetService;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

/**
 * 
 * @생성 전인찬
 * @작업 전인찬
 *
 */

@Controller
@Slf4j
public class WidgetController {
	
	@Autowired
	WidgetService widgetService;

	final String AREACODE_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?";
	final String CATEGORYCODE_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?";
	final String AREABASEDLIST_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?";
	final String SEARCHKEYWORD_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?";
	final String LOCATIONBASEDLIST_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/locationBasedList?";
	final String SEARCHFESTIVAL_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/searchFestival?";
	final String SEARCHCOURSE_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/searchCourse?";
	final String SEARCHSTAY_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?";
	final String DETAILINTRO_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?";
	final String DETAILINFO_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/detailInfo?";
	final String DETAILIMAGE_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?";
	final String DETAILCOMMON_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?";

	final String SERVICE_KEY = "ServiceKey=WJrWhTS5sO0umKspB%2F6l3eIML4y24JazyOw7uenJR%2F%2FnZ6LQfNHV09G8L47Al%2BdjLJIxbskdBRU6Rx8qwkJWoQ%3D%3D";
	final String LAST_URL = "&MobileOS=ETC&MobileApp=TMI&_type=json";
	final String LAST_URL2 = "&MobileOS=ETC&MobileApp=TMI";
	final String DETAILCOMMON_LAST_URL = "&defaultYN=Y&firstImageYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=TMI&_type=json";

	@GetMapping("/widget/callArea.do")
	public void callArea(HttpServletResponse request, HttpServletResponse response)
			throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html, charset=utf-8");

		String addr = AREACODE_URL;

		PrintWriter out = response.getWriter();

		addr = addr + SERVICE_KEY + "&numOfRows=17" + LAST_URL;

		URL url = new URL(addr);

		InputStream in = url.openStream();

		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();

		String mbos = bos1.toString("UTF-8");

		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);

		JSONObject json = new JSONObject();
		json.put("data", s);
	}

	@GetMapping("/widget/callAreaCode.do")
	public void callAreaCode(HttpServletResponse request, HttpServletResponse response, @RequestParam String areaCode)
			throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html, charset=utf-8");

		String addr = AREACODE_URL;
		String parameter = "";

		PrintWriter out = response.getWriter();

		if (!areaCode.equals("0")) {

			parameter = parameter + "&" + "areaCode=" + areaCode;
			parameter = parameter + LAST_URL;

			addr = addr + SERVICE_KEY + parameter;
		} else {
			
			parameter = parameter + LAST_URL;
			
			addr = addr + SERVICE_KEY + parameter;
		};

		URL url = new URL(addr);

		InputStream in = url.openStream();

		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();

		String mbos = bos1.toString("UTF-8");

		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);

		JSONObject json = new JSONObject();
		json.put("data", s);

	}
	
	@GetMapping("/widget/callCat1Code.do")
	public void callCat1Code(HttpServletResponse request, HttpServletResponse response)
			throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html, charset=utf-8");

		String addr = CATEGORYCODE_URL;
		String parameter = "";

		PrintWriter out = response.getWriter();

			parameter = parameter + LAST_URL;

			addr = addr + SERVICE_KEY + "&numOfRows=8" + parameter;

		URL url = new URL(addr);

		InputStream in = url.openStream();

		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();

		String mbos = bos1.toString("UTF-8");

		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);

		JSONObject json = new JSONObject();
		json.put("data", s);

	}

	@GetMapping("/widget/callCat2Code.do")
	public void callCat2Code(HttpServletResponse request, HttpServletResponse response, @RequestParam String cat1)
			throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html, charset=utf-8");

		String addr = CATEGORYCODE_URL;
		String parameter = "";
		PrintWriter out = response.getWriter();

		if (!cat1.equals("0")) {

			parameter = parameter + "&" + "cat1=" + cat1;
			parameter = parameter + LAST_URL;

			addr = addr + SERVICE_KEY + parameter;

		} else {

			parameter = parameter + LAST_URL;

			addr = addr + SERVICE_KEY + parameter;

		};

		URL url = new URL(addr);

		InputStream in = url.openStream();

		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();

		String mbos = bos1.toString("UTF-8");

		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);

		JSONObject json = new JSONObject();
		json.put("data", s);

	}

	@GetMapping("/widget/callCat3Code.do")
	public void callCat3Code(HttpServletResponse request, HttpServletResponse response, @RequestParam String cat1,
			@RequestParam String cat2) throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html, charset=utf-8");

		String addr = CATEGORYCODE_URL;
		String parameter = "";
		PrintWriter out = response.getWriter();

		if (cat2.equals("0")) {

			parameter = parameter + "&" + "cat1=" + cat1;
			parameter = parameter + LAST_URL;

			addr = addr + SERVICE_KEY + parameter;

		} else {

			parameter = parameter + "&" + "cat1=" + cat1;
			parameter = parameter + "&" + "cat2=" + cat2;
			parameter = parameter + LAST_URL;

			addr = addr + SERVICE_KEY + parameter;

		};

		URL url = new URL(addr);
		InputStream in = url.openStream();
		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();

		String mbos = bos1.toString("UTF-8");

		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);

		JSONObject json = new JSONObject();
		json.put("data", s);

	}

	@GetMapping("/widget/callAreaBasedListlength.do")
	public void callAreaBasedListlength(HttpServletResponse request, HttpServletResponse response,
			@RequestParam String areaCode, @RequestParam String sigunguCode) throws Exception {

		// , @RequestParam String cat1, @RequestParam String cat2, @RequestParam String cat3
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html, charset=utf-8");

		String addr = AREABASEDLIST_URL;
		String parameter = "";
		System.out.println("areaCode = " + areaCode);
		System.out.println("sigunguCode = " + sigunguCode);

		PrintWriter out = response.getWriter();
		
		if (areaCode.equals("0")) {
			
			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "listYN=N";
			parameter = parameter + LAST_URL;

			addr = addr + SERVICE_KEY + parameter;
			
		} else if (!areaCode.equals("0") && sigunguCode.equals("0")) {
			
			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "listYN=N";
			parameter = parameter + "&" + "areaCode=" + areaCode;
			parameter = parameter + LAST_URL;

			addr = addr + SERVICE_KEY + parameter;

		} else {

			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "listYN=N";
			parameter = parameter + "&" + "areaCode=" + areaCode;
			parameter = parameter + "&" + "sigunguCode=" + sigunguCode;
			parameter = parameter + LAST_URL;
			
			addr = addr + SERVICE_KEY + parameter;
			
		};

		URL url = new URL(addr);
		System.out.println(addr);

		InputStream in = url.openStream();

		ByteArrayOutputStream bos1 = new ByteArrayOutputStream();
		IOUtils.copy(in, bos1);
		in.close();
		bos1.close();

		String mbos = bos1.toString("UTF-8");

		byte[] b = mbos.getBytes("UTF-8");
		String s = new String(b, "UTF-8");
		out.println(s);

		JSONObject json = new JSONObject();
		json.put("data", s);
	}
	
	@GetMapping("/widget/callAreaBasedList.do")
	public ResponseEntity<?> callAreaBasedList(@RequestParam String areaCode, @RequestParam String sigunguCode, @RequestParam String totalCount) throws Exception {
		// , @RequestParam String cat1, @RequestParam String cat2, @RequestParam String cat3
		Map<String, Object> map = new HashMap<>();
		
		int CPage = 1;
		int numPerPage = 8;
		int totalContent = Integer.parseInt(totalCount);
		String url = "callAreaBasedList.do";
		
		map.put("CPage", CPage);
		map.put("numPerPage", numPerPage);
		map.put("totalContent", totalContent);
		map.put("url", url);		
		
		String addr = AREABASEDLIST_URL;
		String parameter = "";
		System.out.println("areaCode = " + areaCode);
		System.out.println("sigunguCode = " + sigunguCode);
		
		if (areaCode.equals("0")) {
			
			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=" + CPage;
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + LAST_URL2;

			addr = addr + SERVICE_KEY + parameter;
			
		} else if (!areaCode.equals("0") && sigunguCode.equals("0")) {
			
			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=" + CPage;
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + "&" + "areaCode=" + areaCode;
			parameter = parameter + LAST_URL2;

			addr = addr + SERVICE_KEY + parameter;

		} else {

			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=" + CPage;
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + "&" + "areaCode=" + areaCode;
			parameter = parameter + "&" + "sigunguCode=" + sigunguCode;
			parameter = parameter + LAST_URL2;
			
			addr = addr + SERVICE_KEY + parameter;
			
		};

		Response response = widgetService.getResponse(addr);
		List<Item> items = response.getBody().getItems();
		map.put("items", items);	
		
		return ResponseEntity
				.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
				.body(map);
	}
	
	@GetMapping("/widget/callPreviousList.do")
	public ResponseEntity<?> callPreviousList(@RequestParam String pageStart, @RequestParam String areaCode, @RequestParam String sigunguCode, @RequestParam String totalCount) throws Exception {
		// , @RequestParam String cat1, @RequestParam String cat2, @RequestParam String cat3
		Map<String, Object> map = new HashMap<>();
		
		int CPage = Integer.parseInt(pageStart) - 5;
		int numPerPage = 8;
		int totalContent = Integer.parseInt(totalCount);
		String url = "callAreaBasedList.do";
		
		map.put("CPage", CPage);
		map.put("numPerPage", numPerPage);
		map.put("totalContent", totalContent);
		map.put("url", url);		
		
		String addr = AREABASEDLIST_URL;
		String parameter = "";
		System.out.println("areaCode = " + areaCode);
		System.out.println("sigunguCode = " + sigunguCode);
		
		if (areaCode.equals("0")) {
			
			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=" + CPage;
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + LAST_URL2;

			addr = addr + SERVICE_KEY + parameter;
			
		} else if (!areaCode.equals("0") && sigunguCode.equals("0")) {
			
			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=" + CPage;
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + "&" + "areaCode=" + areaCode;
			parameter = parameter + LAST_URL2;

			addr = addr + SERVICE_KEY + parameter;

		} else {

			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=" + CPage;
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + "&" + "areaCode=" + areaCode;
			parameter = parameter + "&" + "sigunguCode=" + sigunguCode;
			parameter = parameter + LAST_URL2;
			
			addr = addr + SERVICE_KEY + parameter;
			
		};

		Response response = widgetService.getResponse(addr);
		List<Item> items = response.getBody().getItems();
		map.put("items", items);	
		
		return ResponseEntity
				.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
				.body(map);
	}
	
	@GetMapping("/widget/callMainList.do")
	public ResponseEntity<?> callMainList(@RequestParam String mainPageNo, @RequestParam String areaCode, @RequestParam String sigunguCode, @RequestParam String totalCount) throws Exception {
		// , @RequestParam String cat1, @RequestParam String cat2, @RequestParam String cat3
		Map<String, Object> map = new HashMap<>();
		
		int CPage = Integer.parseInt(mainPageNo);
		int numPerPage = 8;
		int totalContent = Integer.parseInt(totalCount);
		String url = "callAreaBasedList.do";
		
		map.put("CPage", CPage);
		map.put("numPerPage", numPerPage);
		map.put("totalContent", totalContent);
		map.put("url", url);		
		
		String addr = AREABASEDLIST_URL;
		String parameter = "";
		System.out.println("areaCode = " + areaCode);
		System.out.println("sigunguCode = " + sigunguCode);
		
		if (areaCode.equals("0")) {
			
			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=" + CPage;
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + LAST_URL2;

			addr = addr + SERVICE_KEY + parameter;
			
		} else if (!areaCode.equals("0") && sigunguCode.equals("0")) {
			
			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=" + CPage;
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + "&" + "areaCode=" + areaCode;
			parameter = parameter + LAST_URL2;

			addr = addr + SERVICE_KEY + parameter;

		} else {

			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=" + CPage;
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + "&" + "areaCode=" + areaCode;
			parameter = parameter + "&" + "sigunguCode=" + sigunguCode;
			parameter = parameter + LAST_URL2;
			
			addr = addr + SERVICE_KEY + parameter;
			
		};

		Response response = widgetService.getResponse(addr);
		List<Item> items = response.getBody().getItems();
		map.put("items", items);	
		
		return ResponseEntity
				.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
				.body(map);
	}
	
	@GetMapping("/widget/callNextList.do")
	public ResponseEntity<?> callNextList(@RequestParam String pageStart, @RequestParam String areaCode, @RequestParam String sigunguCode, @RequestParam String totalCount) throws Exception {
		// , @RequestParam String cat1, @RequestParam String cat2, @RequestParam String cat3
		Map<String, Object> map = new HashMap<>();
		
		int CPage = Integer.parseInt(pageStart) + 5;
		int numPerPage = 8;
		int totalContent = Integer.parseInt(totalCount);
		String url = "callAreaBasedList.do";
		
		map.put("CPage", CPage);
		map.put("numPerPage", numPerPage);
		map.put("totalContent", totalContent);
		map.put("url", url);		
		
		String addr = AREABASEDLIST_URL;
		String parameter = "";
		System.out.println("areaCode = " + areaCode);
		System.out.println("sigunguCode = " + sigunguCode);
		
		if (areaCode.equals("0")) {
			
			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=" + CPage;
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + LAST_URL2;

			addr = addr + SERVICE_KEY + parameter;
			
		} else if (!areaCode.equals("0") && sigunguCode.equals("0")) {
			
			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=" + CPage;
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + "&" + "areaCode=" + areaCode;
			parameter = parameter + LAST_URL2;

			addr = addr + SERVICE_KEY + parameter;

		} else {

			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=" + CPage;
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + "&" + "areaCode=" + areaCode;
			parameter = parameter + "&" + "sigunguCode=" + sigunguCode;
			parameter = parameter + LAST_URL2;
			
			addr = addr + SERVICE_KEY + parameter;
			
		};

		Response response = widgetService.getResponse(addr);
		List<Item> items = response.getBody().getItems();
		map.put("items", items);	
		
		return ResponseEntity
				.status(HttpStatus.OK)
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
				.body(map);
	}
}