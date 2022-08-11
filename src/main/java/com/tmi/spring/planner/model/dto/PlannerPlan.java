package com.tmi.spring.planner.model.dto;

import java.sql.Date;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	private Date ppTime;
	private String ppPlaceName;
	private String ppMemo;
	private String ppX;
	private String ppY;
	private Date ppDate;
}
