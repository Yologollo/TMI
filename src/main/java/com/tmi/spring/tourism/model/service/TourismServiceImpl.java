package com.tmi.spring.tourism.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.tmi.spring.tourism.tourdata.areacode.AreaCode;
import com.tmi.spring.tourism.tourdata.areacode.AreaCodeBody;
import com.tmi.spring.tourism.tourdata.areacode.AreaCodeData;

import lombok.extern.slf4j.Slf4j;

@Service
public class TourismServiceImpl implements TourismService {
	
	@Override
	public AreaCodeData getAreaCode(String url) {
		AreaCodeData areacodedata = new AreaCodeData();
		AreaCodeBody areacodebody = new AreaCodeBody();
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(url);
			NodeList nodeList = doc.getElementsByTagName("item");
			List<AreaCode> areacodes = new ArrayList<>();
			for(int i = 0; i < nodeList.getLength(); i++) {
				Element elem = (Element) nodeList.item(i);
				int rnum = Integer.parseInt(getTextContent(elem, "rnum"));
				int code = Integer.parseInt(getTextContent(elem, "code"));
				String name = getTextContent(elem, "name");
				AreaCode areacode = new AreaCode(rnum, code, name);
				areacodes.add(areacode);
			}
			areacodebody.setAreacode(areacodes);
			areacodedata.setAreacodebody(areacodebody);
			
		} catch (ParserConfigurationException | SAXException | IOException e) {
			e.printStackTrace();
		}
		return areacodedata;
	}
	
	

	private String getTextContent(Element elem, String tagName) {
		return elem.getElementsByTagName(tagName).item(0).getTextContent();
	}
}
