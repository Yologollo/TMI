package com.tmi.spring.widget.model.service;

import java.io.IOException;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.tmi.spring.widget.data.Response;

@Service
public class WidgetServiceImpl implements WidgetService {
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@Override
	public Response getResponse(String url) {
		ObjectMapper xmlMapper = new XmlMapper().registerModule(new JavaTimeModule());
		
		try {
			return xmlMapper.readValue(new URL(url), Response.class);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	

}
