package com.tmi.spring.tourism.tourdata.detailcommon;

import com.tmi.spring.tourism.tourdata.Header;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailCommonData {
	
	private Header header;
	private DetailCommonBody detailcommonbody;

}
