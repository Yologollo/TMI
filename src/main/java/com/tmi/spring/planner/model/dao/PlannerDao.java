package com.tmi.spring.planner.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;

@Mapper
public interface PlannerDao {

	int createPlanner(Planner planner);

	@Select("select * from tmi_planner where p_no = #{pNo}")
	Planner selectOnePlanner(int pNo);

	@Select("select * from tmi_planner where p_m_email = #{pmEmail} order by p_write_date desc")
	List<Planner> findPlannerByEmail(String memberEmail);

	@Select("select * from tmi_planner where p_no = #{pNo}")
	List<Planner> findPlannerBypNo(int pNo);

	@Delete("delete from tmi_planner where p_no = #{pNo}")
	int deletePlanner(int pNo);

	int savePlannerPlan(List<PlannerPlan> planList);

	

}
