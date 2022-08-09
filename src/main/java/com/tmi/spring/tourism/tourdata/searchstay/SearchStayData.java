package com.tmi.spring.tourism.tourdata.searchstay;

import com.tmi.spring.tourism.tourdata.Header;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchStayData {
	private Header header;
	private SearchStayBody searchstaybody;
}
