package com.tmi.spring.board.review.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmi.spring.board.review.model.dao.ReviewBoardDao;
import com.tmi.spring.board.review.model.dto.InsertReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoardAttachment;
import com.tmi.spring.board.review.model.dto.ReviewBoardComment;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class ReviewBoardServiceImpl implements ReviewBoardService  {

	@Autowired
	ReviewBoardDao reviewBoardDao;
	
	@Override
	public List<ReviewBoard> selectReviewBoardList(int cPage, int numPerPage) {
		int offset = (cPage -1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return reviewBoardDao.selectReviewBoardList(rowBounds);
	}
	
	@Override
	public int selectTotalContent() {
		return reviewBoardDao.selectTotalContent();
	}
	
	@Override
	public int insertReviewBoard(InsertReviewBoard insertReviewBoard) {
		int result = reviewBoardDao.insertReviewBoard(insertReviewBoard);
		log.debug("insertReviewBoard = {}", insertReviewBoard.getRbNo());
		
		List<ReviewBoardAttachment> attachments = insertReviewBoard.getAttachments();
		if(!attachments.isEmpty())
		{
			for(ReviewBoardAttachment attach : attachments)
			{
				attach.setRbaRbNo(insertReviewBoard.getRbNo());
				result = reviewBoardDao.insertAttachment(attach);
			}
		}
		return result;
	}
	
	@Override
	public InsertReviewBoard selectOneReviewBoard(int no) {
		InsertReviewBoard insertReviewBoard = reviewBoardDao.selectOneReviewBoard(no);
		List<ReviewBoardAttachment> attachments = reviewBoardDao.selectAttachmentListByNo(no);
		List<ReviewBoardComment> comments = reviewBoardDao.findBoardCommentByNo(no);
		
		insertReviewBoard.setAttachments(attachments);
		insertReviewBoard.setBoardComments(comments);
		
		return insertReviewBoard;
	}
	
	@Override
	public ReviewBoardAttachment selectOneAttachment(int attachNo) {
		return reviewBoardDao.selectOneAttachment(attachNo);
	}
	
	@Override
	public int deleteAttachment(int attachNo) {
		return reviewBoardDao.deleteAttachment(attachNo);
	}
	
	@Override
	public int updateReviewBoard(InsertReviewBoard insertReviewBoard) {
		int result = reviewBoardDao.updateReviewBoard(insertReviewBoard);
		
		List<ReviewBoardAttachment> attachments = insertReviewBoard.getAttachments();
		if(!attachments.isEmpty()) {
			for(ReviewBoardAttachment attach : attachments)
				result = reviewBoardDao.insertAttachment(attach);
		}
		return result;
	}
	
	@Override
	public int deleteReviewBoard(int no) {
		return reviewBoardDao.deleteReviewBoard(no);
	}
	
	@Override
	public int insertReviewComment(ReviewBoardComment rbComment) {
		return reviewBoardDao.insertReviewComment(rbComment);
	}
	@Override
	public int deleteReviewBoardComment(int rbcNo) {
		return reviewBoardDao.deleteReviewBoardComment(rbcNo);
	}
	
	@Override
	public int updateReadCount(int no) {
		return reviewBoardDao.updateReadCount(no);
	}
	
}
