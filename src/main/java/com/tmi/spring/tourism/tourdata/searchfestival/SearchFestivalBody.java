package com.tmi.spring.tourism.tourdata.searchfestival;

import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchFestivalBody {
	
	@JacksonXmlElementWrapper(useWrapping = true)
	@JacksonXmlProperty(localName = "searchfestival")
	List<SearchFestivalItem> searchfestivalitem;
	int numOfRows;
	int pageNo;
	int totalCount;

}
