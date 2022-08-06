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
	private long pp_no;
	private long pp_p_no;
	private Date pp_date;
	private String pp_place_name;
	private String pp_memo;
	private Float pp_x;
	private Float pp_y;
}
