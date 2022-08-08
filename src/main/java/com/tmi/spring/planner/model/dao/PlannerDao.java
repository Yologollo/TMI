package com.tmi.spring.planner.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.tmi.spring.planner.model.dto.Planner;

@Mapper
public interface PlannerDao {

	int createPlanner(Planner planner);

	@Select("select * from tmi_planner where p_no = #{pNo}")
	Planner selectOnePlanner(int pNo);

}
