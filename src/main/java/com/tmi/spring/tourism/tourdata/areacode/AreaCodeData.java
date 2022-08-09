package com.tmi.spring.tourism.tourdata.areacode;

import com.tmi.spring.tourism.tourdata.Header;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AreaCodeData {

		private Header header;
		private AreaCodeBody areacodebody;
		
}
