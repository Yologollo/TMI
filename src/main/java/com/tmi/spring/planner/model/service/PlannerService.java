package com.tmi.spring.planner.model.service;

import java.sql.Date;
import java.text.ParseException;
import java.util.List;

import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;

public interface PlannerService {

	int createPlanner(Planner planner);

	Planner selectOnePlanner(int pNo);

	List<Date> selectPlanDateList(Date pLeaveDate, Date pReturnDate);

	List<Planner> findPlannerByEmail(String memberEmail);

	List<Planner> findPlannerBypNo(int pNo);

	int deletePlanner(int pNo);

	int savePlannerPlan(List<PlannerPlan> planList);

}
