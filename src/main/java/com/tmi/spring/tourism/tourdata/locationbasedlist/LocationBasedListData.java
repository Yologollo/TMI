package com.tmi.spring.tourism.tourdata.locationbasedlist;

import com.tmi.spring.tourism.tourdata.Header;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LocationBasedListData {
	
	private Header header;
	private LocationBasedListBody locationbasedlistbody;

}
