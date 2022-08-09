package com.tmi.spring.tourism.tourdata.categorycode;

import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryCodeBody {
	@JacksonXmlElementWrapper(useWrapping = true)
	@JacksonXmlProperty(localName = "category")
	List<CategoryCodeItem> categorycode;
	int numOfRows;
	int pageNo;
	int totalCount;
}
