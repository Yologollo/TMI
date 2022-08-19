package com.tmi.spring.board.planner.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmi.spring.board.planner.model.dao.PlannerBoardDao;
import com.tmi.spring.board.planner.model.dto.InsertPlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoard;
import com.tmi.spring.board.review.model.dto.InsertReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoardAttachment;
import com.tmi.spring.board.review.model.dto.ReviewBoardComment;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class PlannerBoardServiceImpl implements PlannerBoardService {
	
	@Autowired
	PlannerBoardDao plannerBoardDao;
	
	@Override
	public List<PlannerBoard> selectPlannerBoardList(int cPage, int numPerPage) {
		int offset = (cPage -1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return plannerBoardDao.selectPlannerBoardList(rowBounds);
	}
	@Override
	public int selectTotalContent() {
		return plannerBoardDao.selectTotalContent();
	}
	
	@Override
	public InsertPlannerBoard selectOnePlannerBoard(int no) {
		InsertPlannerBoard insertPlannerBoard = plannerBoardDao.selectOneReviewBoard(no);
		List<ReviewBoardComment> comments = plannerBoardDao.findBoardCommentByNo(no);
//		List<Planner> planner = plannerBoardDao.findBoardPlannerByNo(no);
//		List<PlannerPlan> plans = plannerBoardDao.findBoardPlanByNo(no);
		
		insertPlannerBoard.setBoardComments(comments);
//		insertReviewBoard.setPlanner(planner);
//		insertReviewBoard.setPlans(plans);
		
		return insertPlannerBoard;
	}
	
	@Override
	public int updateReadCount(int no) {
		return plannerBoardDao.updateReadCount(no);
	}
	
	@Override
	public int loveCount(int no) {
		return plannerBoardDao.loveCount(no);
	}

}
