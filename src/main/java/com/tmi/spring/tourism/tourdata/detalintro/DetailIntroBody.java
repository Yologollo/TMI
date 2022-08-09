package com.tmi.spring.tourism.tourdata.detalintro;

import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailIntroBody {

	@JacksonXmlElementWrapper(useWrapping = true)
	@JacksonXmlProperty(localName = "detailintro")
	List<DetailIntroItem> detailintroitem;
	int numOfRows;
	int pageNo;
	int totalCount;
}
