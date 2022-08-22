package com.tmi.spring.planner.model.dto;

import java.sql.Date;
import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate pLeaveDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate pReturnDate;
	private Date pWriteDate;
//	private String pShare;
}
