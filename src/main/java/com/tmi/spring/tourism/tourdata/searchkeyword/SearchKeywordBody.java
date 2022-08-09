package com.tmi.spring.tourism.tourdata.searchkeyword;

import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchKeywordBody {
	
	@JacksonXmlElementWrapper(useWrapping = true)
	@JacksonXmlProperty(localName = "searchkeyword")
	List<SearchKeywordItem> searchkeyworditem;
	int numOfRows;
	int pageNo;
	int totalCount;

}
