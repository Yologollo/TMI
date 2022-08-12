package com.tmi.spring.planner.model.service;

import java.sql.Date;
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
	public List<Date> selectPlanDateList(Date pLeaveDate, Date pReturnDate) {
		Calendar cal = Calendar.getInstance();
		
	    int count = getDiffDayCount(pLeaveDate, pReturnDate);
	    cal.add(Calendar.DATE, -1);
	    List result = new ArrayList();
	    
	    for(int i = 0; i <= count; i++) {
	        cal.add(Calendar.DATE, 1);
	        Date sqlDate = new Date(cal.getTimeInMillis());
	        result.add(sqlDate);
	    }
        return result;
	}
	
	public int getDiffDayCount(Date pLeaveDate, Date pReturnDate){
        return (int) ((pReturnDate.getTime() - pLeaveDate.getTime()) / 1000 / 60 / 60 / 24);
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
	public int savePlannerPlanMap(PlannerPlan plan) {
		return plannerDao.savePlannerPlanMap(plan);
	}
	

}
