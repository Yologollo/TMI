package com.tmi.spring.board.friend.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmi.spring.board.friend.model.dao.FriendBoardDao;
import com.tmi.spring.board.friend.model.dto.FriendBoard;
import com.tmi.spring.board.friend.model.dto.FriendBoardAttachment;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;

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
	public int insertFriendBoard(InsertFriendBoard insertFriendBoard) {
		int result = friendBoardDao.insertFriendBoard(insertFriendBoard);
		log.debug("insertFriendBoard = {}", insertFriendBoard.getFb_no());
		
		List<FriendBoardAttachment> attachments = insertFriendBoard.getAttachments();
		if(!attachments.isEmpty())
		{
			for(FriendBoardAttachment attach : attachments)
			{
				attach.setFba_fb_no(insertFriendBoard.getFb_no());
				result = friendBoardDao.insertAttachment(attach);
			}
		}
		return result;
	}
	
	@Override
	public InsertFriendBoard selectOneFriendBoard(int no) {
		InsertFriendBoard insertFriendBoard = friendBoardDao.selectOneFriendBoard(no);
		List<FriendBoardAttachment> attachments = friendBoardDao.selectAttachmentListByNo(no);
		insertFriendBoard.setAttachments(attachments);
		
		return insertFriendBoard;
	}
	

	
}
