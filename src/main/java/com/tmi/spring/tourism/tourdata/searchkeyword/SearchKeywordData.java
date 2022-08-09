package com.tmi.spring.tourism.tourdata.searchkeyword;

import com.tmi.spring.tourism.tourdata.Header;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchKeywordData {
	
	private Header header;
	private SearchKeywordBody searchkeywordbody;

}
