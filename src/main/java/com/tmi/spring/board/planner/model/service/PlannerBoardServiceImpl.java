package com.tmi.spring.board.planner.model.service;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmi.spring.board.planner.model.dao.PlannerBoardDao;
import com.tmi.spring.board.planner.model.dto.InsertPlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoardComment;
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
		List<PlannerBoardComment> comments = plannerBoardDao.findBoardCommentByNo(no);
		List<Planner> planner = plannerBoardDao.findBoardPlannerByNo(no);
		List<PlannerPlan> plans = plannerBoardDao.findBoardPlanByNo(no);
		
		insertPlannerBoard.setBoardComments(comments);
		insertPlannerBoard.setPlanner(planner);
		insertPlannerBoard.setPlans(plans);
		
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
	//----------------------
	
	@Override
	public int deletePlannerBoard(int no) {
		return plannerBoardDao.deletePlannerBoard(no);
	}
	
	@Override
	public int deletePlannerBoardComment(int pbcNo) {
		return plannerBoardDao.deletePlannerBoardComment(pbcNo);
	}
	
	@Override
	public int insertLove(int loNo, String email) {
		return plannerBoardDao.insertLove(loNo, email);
	}
	@Override
	public int insertPlannerBoard(InsertPlannerBoard insertPlannerBoard) {
		int result = plannerBoardDao.insertPlannerBoard(insertPlannerBoard);
		log.debug("insertReviewBoard = {}", insertPlannerBoard.getPbNo());
		
		return result;
	}
	
	@Override
	public int insertPlannerComment(PlannerBoardComment pbComment) {
		return plannerBoardDao.insertPlannerComment(pbComment);
	}
	
	@Override
	public String selectFindLove(int loNo, String email) {
		return plannerBoardDao.selectFindLove(loNo, email);
	}
	
	@Override
	public int updatePlannerBoard(InsertPlannerBoard insertPlannerBoard) {
		int result = plannerBoardDao.updatePlannerBoard(insertPlannerBoard);

		return result;
	}	
	
	@Override
	public Planner findBoardPlannerByNoModel(int no) {
		return plannerBoardDao.findBoardPlannerByNoModel(no);
	}
	
	@Override
	public List<PlannerPlan> findPlansList(List<PlannerBoard> list) {
		return plannerBoardDao.findPlansList(list);
	}
	
	@Override
	public int savePlanner(Planner planner) {
		return plannerBoardDao.savePlanner(planner);
	}
	
	@Override
	public Planner findNo(int pNo) {
		return plannerBoardDao.findNo(pNo);
	}
	
	@Override
	public List<PlannerPlan> savePlannerPlan(int n, int saveNo, List<Date> ppTime, List<String> ppPlaceName,
			List<String> ppMemo, List<String> ppX, List<String> ppY, List<Date> ppDate) {
		PlannerPlan pp = new PlannerPlan();
		
		for(int i = 0; i < ppMemo.size(); i++) {
			log.debug("i = {}", i);
			pp.setPppNo(saveNo);
			pp.setPpTime(ppTime.get(i));
			pp.setPpPlaceName(ppPlaceName.get(i));
			pp.setPpMemo(ppMemo.get(i));
			pp.setPpX(Float.parseFloat(ppX.get(i)));
			pp.setPpY(Float.parseFloat(ppY.get(i)));
			pp.setPpDate(ppDate.get(i));
			plannerBoardDao.insertPlannerPlan(pp);
		}
		return null;
	}

}















