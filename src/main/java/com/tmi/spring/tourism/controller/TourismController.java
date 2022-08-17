package com.tmi.spring.tourism.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
//@RequestMapping("/tourism")
public class TourismController {
	
	@GetMapping("/tourism")
	public String index() {
		log.info("GET / 요청!");
		return "/tourism/tourism";
	}
	
	final String DETAILCOMMON_URL = "https://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?";

	final String SERVICE_KEY = "ServiceKey=WJrWhTS5sO0umKspB%2F6l3eIML4y24JazyOw7uenJR%2F%2FnZ6LQfNHV09G8L47Al%2BdjLJIxbskdBRU6Rx8qwkJWoQ%3D%3D";
	final String DETAILCOMMON_LAST_URL = "&defaultYN=Y&firstImageYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=TMI&_type=json";
	
	@GetMapping("/tourism/callDetailCommon.do")
	public void callAreaCode(HttpServletResponse request, HttpServletResponse response, @RequestParam String contentId)
			throws Exception {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html, charset=utf-8");

		String addr = DETAILCOMMON_URL;
		String parameter = "";

		PrintWriter out = response.getWriter();


		parameter = parameter + "&" + "contentId=" + contentId;
		parameter = parameter + DETAILCOMMON_LAST_URL;

		addr = addr + SERVICE_KEY + parameter;

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

}
