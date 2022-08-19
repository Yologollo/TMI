package com.tmi.spring;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tmi.spring.common.HelloSpringUtils;
import com.tmi.spring.test.controller.TestController;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

/**
 * 
 * @생성 김용민
 * @작업 김용민
 *
 */

@Controller
@Slf4j
public class HomeController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "index";
//	}
	
//	@GetMapping("/")
//	public String index() {
//		log.info("GET / 요청!");
//		return "forward:/index.jsp";
//	}
	
	
	// 관광정보 위젯
	
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
	final String DETAILCOMMON_LAST_URL = "&defaultYN=Y&firstImageYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=TMI&_type=json";


	@GetMapping("/index/callAreaCode.do")
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

		}
		;

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

	@GetMapping("/index/callCat2Code.do")
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

		}
		;

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

	@GetMapping("/index/callCat3Code.do")
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

		}
		;

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

	@GetMapping("/index/callAreaBasedListlength.do")
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
	
	@GetMapping("/index/callAreaBasedList.do")
	public void callAreaBasedList(HttpServletResponse request, HttpServletResponse response,
			@RequestParam String areaCode, @RequestParam String sigunguCode, @RequestParam String totalCount, ModelAndView mav) throws Exception {
		// , @RequestParam String cat1, @RequestParam String cat2, @RequestParam String cat3
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html, charset=utf-8");

		int cPage = 1;
		int numPerPage = 8;
		int totalContent = Integer.parseInt(totalCount);
		String url = "";
		
		String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
		mav.addObject("pagebar", pagebar);
		
		String addr = AREABASEDLIST_URL;
		String parameter = "";
		System.out.println("areaCode = " + areaCode);
		System.out.println("sigunguCode = " + sigunguCode);

		PrintWriter out = response.getWriter();
		
		if (areaCode.equals("0")) {
			
			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=1";
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + LAST_URL;

			addr = addr + SERVICE_KEY + parameter;
			
		} else if (!areaCode.equals("0") && sigunguCode.equals("0")) {
			
			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=1";
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + "&" + "areaCode=" + areaCode;
			parameter = parameter + LAST_URL;

			addr = addr + SERVICE_KEY + parameter;

		} else {

			parameter = parameter + "&" + "numOfRows=8";
			parameter = parameter + "&" + "pageNo=1";
			parameter = parameter + "&" + "listYN=Y";
			parameter = parameter + "&" + "areaCode=" + areaCode;
			parameter = parameter + "&" + "sigunguCode=" + sigunguCode;
			parameter = parameter + LAST_URL;
			
			addr = addr + SERVICE_KEY + parameter;
			
		};

		URL url2 = new URL(addr);
		System.out.println(addr);

		InputStream in = url2.openStream();

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
