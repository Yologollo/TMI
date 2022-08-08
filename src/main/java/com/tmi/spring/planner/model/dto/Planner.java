package com.tmi.spring.planner.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Planner {
	private int pNo;
	private String pmEmail;
	private String pTitle;
	private String pExplan;
	private Date pLeaveDate;
	private Date pReturnDate;
	private Date pWriteDate;
	private String pShare;
}
