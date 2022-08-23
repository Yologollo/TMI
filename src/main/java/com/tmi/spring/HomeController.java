package com.tmi.spring;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tmi.spring.board.review.model.dto.ReviewBoard;
import com.tmi.spring.board.review.model.service.ReviewBoardService;
import com.tmi.spring.common.HelloSpringUtils;
import com.tmi.spring.planner.model.service.PlannerService;
import com.tmi.spring.test.controller.TestController;
import com.tmi.spring.widget.data.Item;
import com.tmi.spring.widget.data.Response;
import com.tmi.spring.widget.model.service.WidgetService;

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
	
	@Autowired
	ReviewBoardService reviewBoardService;
	
	@Autowired
	ServletContext application;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@Autowired
	PlannerService plannerService;
	
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
//	
//	@GetMapping("/")
//	public ModelAndView index( @RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request, Model model) {
//		try {
//			int numPerPage = 3;
//			List<ReviewBoard> list4 = reviewBoardService.selectMainReviewBoardList(cPage, numPerPage);
//			Iterator<ReviewBoard> it = list4.iterator();
//
//			log.debug("list4 = {}", list4);
////			mav.addObject("list4", list4);
//			model.addAttribute("list4", list4);
//			
//			int totalContent = reviewBoardService.selectTotalContent();
//			String url = request.getRequestURI();
//			log.debug("url = {}", url);
//
//			while(it.hasNext()) {
//				ReviewBoard boardEntity = it.next();
//				
//				//Jsoup를 이용해서 첫번째 img의 src의 값을 팡싱한 후 값을 저장
//				Document doc = Jsoup.parse(boardEntity.getRb_content());
//				if(doc.selectFirst("img") != null) {
//					String src = doc.selectFirst("img").attr("src");
//					boardEntity.setRb_content(src);
//				}
//			}
//			
//			log.debug("totalContent = {}", totalContent);
//			String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
//			log.debug("pagebar = {}", pagebar);
//			mav.addObject("pagebar", pagebar);
//			
//			mav.setViewName("index");	
//			
//		} catch (Exception e) {
//			log.error("게시글 목록 조회 오류",e);
//			throw e;
//		}
//		return mav;
//	}
	
	@GetMapping("/")
    public  ModelAndView index( @RequestParam(defaultValue = "1") int cPage, ModelAndView mav, HttpServletRequest request, Model model) {
        try {
            int numPerPage = 3;
            List<ReviewBoard> list4 = reviewBoardService.selectMainReviewBoardList(cPage, numPerPage);
            Iterator<ReviewBoard> it = list4.iterator();

            log.debug("list4 = {}", list4);
//            mav.addObject("list4", list4);
            model.addAttribute("list4", list4);
            
            int totalContent = reviewBoardService.selectTotalContent();
            String url = request.getRequestURI();
            log.debug("url = {}", url);

            while(it.hasNext()) {
                ReviewBoard boardEntity = it.next();
                
                //Jsoup를 이용해서 첫번째 img의 src의 값을 팡싱한 후 값을 저장
                Document doc = Jsoup.parse(boardEntity.getRb_content());
                if(doc.selectFirst("img") != null) {
                    String src = doc.selectFirst("img").attr("src");
                    boardEntity.setRb_content(src);
                }
            }
            
            log.debug("totalContent = {}", totalContent);
//            String pagebar = HelloSpringUtils.getPagebar(cPage, numPerPage, totalContent, url);
//            log.debug("pagebar = {}", pagebar);
//            mav.addObject("pagebar", pagebar);
            
            mav.setViewName("forward:/index.jsp");    
            
        } catch (Exception e) {
            log.error("게시글 목록 조회 오류",e);
            throw e;
        }
        return mav;
    }

}
