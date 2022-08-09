package com.tmi.spring.tourism.tourdata.detalintro;

import com.tmi.spring.tourism.tourdata.Header;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DetailIntroData {
	private Header header;
	private DetailIntroBody detailintrobody;
}
