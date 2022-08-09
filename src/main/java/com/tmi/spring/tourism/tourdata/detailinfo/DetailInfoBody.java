package com.tmi.spring.tourism.tourdata.detailinfo;

import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailInfoBody {
	@JacksonXmlElementWrapper(useWrapping = true)
	@JacksonXmlProperty(localName = "detailinfo")
	List<DetailInfoItem> detailinfoitem;
	int numOfRows;
	int pageNo;
	int totalCount;

}
