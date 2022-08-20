package com.tmi.spring.board.planner.model.service;

import java.util.List;

import com.tmi.spring.board.planner.model.dto.InsertPlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoardComment;
import com.tmi.spring.planner.model.dto.Planner;

public interface PlannerBoardService {

	List<PlannerBoard> selectPlannerBoardList(int cPage, int numPerPage);

	int selectTotalContent();

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

}
