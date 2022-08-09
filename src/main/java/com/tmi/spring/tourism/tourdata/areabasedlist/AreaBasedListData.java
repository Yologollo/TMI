package com.tmi.spring.tourism.tourdata.areabasedlist;

import com.tmi.spring.tourism.tourdata.Header;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AreaBasedListData {

	private Header header;
	private AreaBasedListBody areabasedlistbody;
	
}
