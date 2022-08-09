package com.tmi.spring.planner.model.service;

import java.sql.Date;
import java.util.List;

import com.tmi.spring.planner.model.dto.Planner;

public interface PlannerService {

	int createPlanner(Planner planner);

	Planner selectOnePlanner(int pNo);

	List<Date> selectPlanDateList(Date pLeaveDate, Date pReturnDate);

	List<Planner> findPlannerByEmail(String memberEmail);

	List<Planner> findPlannerBypNo(int pNo);

	int deletePlanner(int pNo);

}
