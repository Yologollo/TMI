package com.tmi.spring.planner.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.tmi.spring.planner.model.dto.Planner;

@Mapper
public interface PlannerDao {

	int createPlanner(Planner planner);

}
