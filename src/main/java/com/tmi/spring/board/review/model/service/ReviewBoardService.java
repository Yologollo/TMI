package com.tmi.spring.board.review.model.service;

import java.util.List;

import com.tmi.spring.board.friend.model.dto.FriendBoard;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;
import com.tmi.spring.board.review.model.dto.InsertReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoardAttachment;
import com.tmi.spring.board.review.model.dto.ReviewBoardComment;
import com.tmi.spring.board.review.model.dto.ReviewBoardLove;

public interface ReviewBoardService {

	List<ReviewBoard> selectReviewBoardList(int cPage, int numPerPage);

	int selectTotalContent();
	
	int insertReviewBoard(InsertReviewBoard insertReviewBoard);
	
	InsertReviewBoard selectOneReviewBoard(int no);

	ReviewBoardAttachment selectOneAttachment(int attachNo);

	int deleteAttachment(int attachNo);

	int updateReviewBoard(InsertReviewBoard insertReviewBoard);

	int deleteReviewBoard(int no);

	int insertReviewComment(ReviewBoardComment rbComment);

	int deleteReviewBoardComment(int rbcNo);

	int updateReadCount(int no);

	int insertLove(int loNo, String email);

	String selectFindLove(int loNo, String email);

	int loveCount(int no);

}
