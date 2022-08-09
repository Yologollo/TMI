package com.tmi.spring.tourism.tourdata.categorycode;

import com.tmi.spring.tourism.tourdata.Header;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryCodeData {
	
	private Header header;
	private CategoryCodeBody categorycodebody;

}
