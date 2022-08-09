package com.tmi.spring.tourism.tourdata.locationbasedlist;

import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LocationBasedListBody {
	@JacksonXmlElementWrapper(useWrapping = true)
	@JacksonXmlProperty(localName = "locationbasedlist")
	List<LocationBasedListItem> locationbasedlistitem;
	int numOfRows;
	int pageNo;
	int totalCount;
}
