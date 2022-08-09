package com.tmi.spring.tourism.tourdata.detailimage;

import com.tmi.spring.tourism.tourdata.Header;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailImageData {
	
	private Header header;
	private DetailImageBody detailimagebody;

}
