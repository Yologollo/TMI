package com.tmi.spring.planner.model.service;

import java.util.List;

import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;

public interface PlannerService {

	int createPlanner(Planner planner);

	Planner selectOnePlanner(int pNo);

	List<Planner> findPlannerByEmail(String memberEmail);

	int deletePlanner(int pNo);

	int savePlannerPlan(List<PlannerPlan> planList);

	List<PlannerPlan> selectPlannerPlanList(int pNo);

	List<PlannerPlan> findPlansList(List<Planner> plannerList);

}
