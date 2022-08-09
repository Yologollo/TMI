package com.tmi.spring.tourism.tourdata.searchfestival;

import com.tmi.spring.tourism.tourdata.Header;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchFestivalData {
	
	private Header header;
	private SearchFestivalBody searchfestivalbody;

}
