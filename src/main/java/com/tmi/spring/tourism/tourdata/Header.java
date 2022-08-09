package com.tmi.spring.tourism.tourdata;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Header {
	private String resultCode;
	private String resultMsg;
}
