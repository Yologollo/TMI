package com.tmi.spring.planner.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 
 * @생성 김용민
 * @작업 김용민
 *
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlannerPlan {
	private long ppNo;
	private long pppNo;
	private Date ppDate;
	private String ppPlaceName;
	private String ppMemo;
	private Float ppX;
	private Float ppY;
}
