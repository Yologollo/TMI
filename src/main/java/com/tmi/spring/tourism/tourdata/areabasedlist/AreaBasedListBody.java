package com.tmi.spring.tourism.tourdata.areabasedlist;

import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AreaBasedListBody {
	@JacksonXmlElementWrapper(useWrapping = true)
	@JacksonXmlProperty(localName = "areabasedlist")
	List<AreaBasedListItem> areabasedlist;
	int numOfRows;
	int pageNo;
	int totalCount;
}
