package com.tmi.spring.board.planner.model.service;

import java.util.List;

import com.tmi.spring.board.planner.model.dto.InsertPlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoard;

public interface PlannerBoardService {

	List<PlannerBoard> selectPlannerBoardList(int cPage, int numPerPage);

	int selectTotalContent();

	InsertPlannerBoard selectOnePlannerBoard(int no);

	int updateReadCount(int no);

	int loveCount(int no);

}
