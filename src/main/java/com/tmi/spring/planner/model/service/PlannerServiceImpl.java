package com.tmi.spring.planner.model.service;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmi.spring.planner.model.dao.PlannerDao;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;

@Service
public class PlannerServiceImpl implements PlannerService {

	@Autowired
	PlannerDao plannerDao;
	
	@Override
	public int createPlanner(Planner planner) {
		return plannerDao.createPlanner(planner);
	}

	@Override
	public Planner selectOnePlanner(int pNo) {
		return plannerDao.selectOnePlanner(pNo);
	}

	@Override
	public List<Planner> findPlannerByEmail(String memberEmail) {
		return plannerDao.findPlannerByEmail(memberEmail);
	}

	@Override
	public List<Planner> findPlannerBypNo(int pNo) {
		return plannerDao.findPlannerBypNo(pNo);
	}
	
	@Override
	public int deletePlanner(int pNo) {
		return plannerDao.deletePlanner(pNo);
	}
	
	@Override
	public int savePlannerPlan(List<PlannerPlan> planList) {
		return plannerDao.savePlannerPlan(planList);
	}
	
	@Override
	public List<PlannerPlan> selectPlannerPlanList(int pNo) {
		return plannerDao.selectPlannerPlanList(pNo);
	}
	

}
