package com.tmi.spring.tourism.tourdata.detailimage;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailImageItem {
	
	private String contentid; //기본정보 : 콘텐츠ID
	private String imgname; //이미지명
	private String originimgurl; //원본이미지
	private String serialnum; //이미지일련번호
	private String smallimageurl; //썸네일이미지

}
