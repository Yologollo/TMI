package com.tmi.spring.planner.model.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 * @생성 김용민
 * @작업 김용민
 *
 */

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PlannerPlan {
	private long ppNo;
	private long pppNo;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm")
	private Date ppTime;
	private String ppPlaceName;
	private String ppMemo;
	private Float ppX;
	private Float ppY;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date ppDate;
	
}
