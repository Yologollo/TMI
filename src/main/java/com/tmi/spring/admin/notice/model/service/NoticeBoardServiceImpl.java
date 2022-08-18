package com.tmi.spring.admin.notice.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmi.spring.admin.notice.model.dao.NoticeBoardDao;
import com.tmi.spring.admin.notice.model.dto.InsertNoticeBoard;
import com.tmi.spring.admin.notice.model.dto.NoticeBoard;
import com.tmi.spring.admin.notice.model.dto.NoticeBoardAttachment;
import com.tmi.spring.board.friend.model.dto.FriendBoardAttachment;
import com.tmi.spring.board.friend.model.dto.FriendBoardComment;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;
import com.tmi.spring.board.friend.model.service.FriendBoardServiceImpl;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class NoticeBoardServiceImpl implements NoticeBoardService {

	
	@Autowired
	NoticeBoardDao noticeBoardDao;
	
	@Override
	public List<NoticeBoard> selectNoticeBoardList(int cPage, int numPerPage) {
		int offset = (cPage -1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return noticeBoardDao.selectNoticeBoardList(rowBounds);
		 
	}
	
	@Override
	public int selectTotalContent() {
		return noticeBoardDao.selectTotalContent();
	}
	
	@Override
	public int insertNoticeBoard(InsertNoticeBoard insertNoticeBoard) {
		int result = noticeBoardDao.insertNoticeBoard(insertNoticeBoard);
		log.debug("insertNoticeBoard = {}", insertNoticeBoard.getNbNo());
		
		List<NoticeBoardAttachment> attachments = insertNoticeBoard.getAttachments();
		if(!attachments.isEmpty())
		{
			for(NoticeBoardAttachment attach : attachments)
			{
				attach.setNbaNbNo(insertNoticeBoard.getNbNo());
				result = noticeBoardDao.insertAttachment(attach);
			}
		}
		return result;
	}

	@Override
	public InsertNoticeBoard selectOneNoticeBoard(int no) {
		InsertNoticeBoard insertNoticeBoard = noticeBoardDao.selectOneNoticeBoard(no);
		List<NoticeBoardAttachment> attachments = noticeBoardDao.selectAttachmentListByNo(no);
		
		
		insertNoticeBoard.setAttachments(attachments);
		
		
		return insertNoticeBoard;
		
	}

	@Override
	public int updateReadCount(int no) {
		return noticeBoardDao.updateReadCount(no);
	}

	@Override
	public int deleteNoticeBoard(int no) {
		return noticeBoardDao.deleteNoticeBoard(no);
	}
	
	
	
}
