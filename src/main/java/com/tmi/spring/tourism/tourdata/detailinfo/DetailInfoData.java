package com.tmi.spring.tourism.tourdata.detailinfo;

import com.tmi.spring.tourism.tourdata.Header;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailInfoData {
	
	private Header header;
	private DetailInfoBody detailinfobody;

}
