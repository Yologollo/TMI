package com.tmi.spring.board.planner.model.service;

import java.sql.Date;
import java.util.List;

import com.tmi.spring.board.planner.model.dto.InsertPlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoardSearch;
import com.tmi.spring.board.review.model.dto.ReviewBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoardComment;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;

public interface PlannerBoardService {

	List<PlannerBoard> selectPlannerBoardList(int cPage, int numPerPage);

	int selectTotalContent();
	
	List<PlannerBoardSearch> selectPlannerBoardSearchList(int cPage, int numPerPage, String searchType, String keyword);

	int selectSearchTotalContent(String searchType, String keyword);

	InsertPlannerBoard selectOnePlannerBoard(int no);

	int updateReadCount(int no);

	int loveCount(int no);
//----------------------
	int insertPlannerBoard(InsertPlannerBoard insertPlannerBoard);

	int updatePlannerBoard(InsertPlannerBoard insertPlannerBoard);

	int deletePlannerBoard(int no);

	int insertPlannerComment(PlannerBoardComment pbComment);

	int deletePlannerBoardComment(int pbcNo);

	String selectFindLove(int loNo, String email);

	int insertLove(int loNo, String email);

	Planner findBoardPlannerByNoModel(int no);

	List<PlannerPlan> findPlansList(List<PlannerBoard> list);

	List<PlannerPlan> findPlansSearchList(List<PlannerBoardSearch> list);
	
	int savePlanner(Planner planner);

	Planner findNo(int pNo);

	List<PlannerPlan> savePlannerPlan(int i, int saveNo, List<Date> ppTime, List<String> ppPlaceName,
			List<String> ppMemo, List<String> ppX, List<String> ppY, List<Date> ppDate);

	List<PlannerBoard> selectBestPlannerBoardList(int cPage, int numPerPage);



}
