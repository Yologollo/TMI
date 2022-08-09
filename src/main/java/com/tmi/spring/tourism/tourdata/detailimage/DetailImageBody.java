package com.tmi.spring.tourism.tourdata.detailimage;

import java.util.List;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailImageBody {
	@JacksonXmlElementWrapper(useWrapping = true)
	@JacksonXmlProperty(localName = "detailimage")
	List<DetailImageItem> detailimage;
	int numOfRows;
	int pageNo;
	int totalCount;
}
