package com.tmi.spring.board.friend.model.service;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmi.spring.board.friend.model.dao.FriendBoardDao;
import com.tmi.spring.board.friend.model.dto.FriendBoard;
import com.tmi.spring.board.friend.model.dto.FriendBoardAttachment;
import com.tmi.spring.board.friend.model.dto.FriendBoardComment;
import com.tmi.spring.board.friend.model.dto.FriendBoardSearch;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class FriendBoardServiceImpl implements FriendBoardService {

	@Autowired
	FriendBoardDao friendBoardDao;
	
	@Override
	public List<FriendBoard> selectFriendBoardList(int cPage, int numPerPage) {
		int offset = (cPage -1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return friendBoardDao.selectFriendBoardList(rowBounds);
	}
	
	@Override
	public int selectTotalContent() {
		return friendBoardDao.selectTotalContent();
	}
	
	@Override
	public List<FriendBoardSearch> selectFriendBoardSearchList(int cPage, int numPerPage, String searchType,
			String keyword) {
		int offset = (cPage -1) * numPerPage;
		int limit = numPerPage;
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		RowBounds rowBounds = new RowBounds(offset, limit);
		return friendBoardDao.selectFriendBoardSearchList(rowBounds, map);
	}
	
	@Override
	public int selectSearchTotalContent(String searchType, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		return friendBoardDao.selectSearchTotalContent(map);
	}
	
	@Override
	public int insertFriendBoard(InsertFriendBoard insertFriendBoard) {
		int result = friendBoardDao.insertFriendBoard(insertFriendBoard);
		log.debug("insertFriendBoard = {}", insertFriendBoard.getFbNo());
		
		List<FriendBoardAttachment> attachments = insertFriendBoard.getAttachments();
		if(!attachments.isEmpty())
		{
			for(FriendBoardAttachment attach : attachments)
			{
				attach.setFbaFbNo(insertFriendBoard.getFbNo());
				result = friendBoardDao.insertAttachment(attach);
			}
		}
		return result;
	}
	
	@Override
	public InsertFriendBoard selectOneFriendBoard(int no) {
		InsertFriendBoard insertFriendBoard = friendBoardDao.selectOneFriendBoard(no);
		List<FriendBoardAttachment> attachments = friendBoardDao.selectAttachmentListByNo(no);
		List<FriendBoardComment> comments = friendBoardDao.findBoardCommentByNo(no);
		List<Planner> planner = friendBoardDao.findBoardPlannerByNo(no);
		List<PlannerPlan> plans = friendBoardDao.findBoardPlanByNo(no);
		
		insertFriendBoard.setAttachments(attachments);
		insertFriendBoard.setBoardComments(comments);
		insertFriendBoard.setPlanner(planner);
		insertFriendBoard.setPlans(plans);
		
		return insertFriendBoard;
//		return friendBoardDao.selectOneFriendBoard(no);

	}
	
	@Override
	public FriendBoardAttachment selectOneAttachment(int attachNo) {
		return friendBoardDao.selectOneAttachment(attachNo);
	}
	
	@Override
	public int deleteAttachment(int attachNo) {
		return friendBoardDao.deleteAttachment(attachNo);
	}
	
	@Override
	public int updateFriendBoard(InsertFriendBoard insertFriendBoard) {
		int result = friendBoardDao.updateFriendBoard(insertFriendBoard);
		
		List<FriendBoardAttachment> attachments = insertFriendBoard.getAttachments();
		if(!attachments.isEmpty()) {
			for(FriendBoardAttachment attach : attachments)
				result = friendBoardDao.insertAttachment(attach);
		}
		return result;
	}
	
	@Override
	public int deleteFriendBoard(int no) {
		return friendBoardDao.deleteFriendBoard(no);
	}
	
	@Override
	public int insertFriendComment(FriendBoardComment fbComment) {
		return friendBoardDao.insertFriendComment(fbComment);
	}
	
	@Override
	public int deleteFriendBoardComment(int fbcNo) {
		return friendBoardDao.deleteFriendBoardComment(fbcNo);
	}
	
	@Override
	public int updateReadCount(int no) {
		return friendBoardDao.updateReadCount(no);
	}
	
	@Override
	public Planner findBoardPlannerByNoModel(int no) {
		return friendBoardDao.findBoardPlannerByNoModel(no);
	}



	
}
