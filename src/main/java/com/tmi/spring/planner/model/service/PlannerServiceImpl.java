package com.tmi.spring.planner.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmi.spring.planner.model.dao.PlannerDao;
import com.tmi.spring.planner.model.dto.Planner;

@Service
public class PlannerServiceImpl implements PlannerService {

	@Autowired
	PlannerDao plannerDao;
	
	@Override
	public int createPlanner(Planner planner) {
		return plannerDao.createPlanner(planner);
	}

}
