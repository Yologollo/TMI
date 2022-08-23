package com.tmi.spring.board.review.model.service;

import java.util.List;

import com.tmi.spring.board.friend.model.dto.FriendBoard;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;
import com.tmi.spring.board.review.model.dto.InsertReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoardAttachment;
import com.tmi.spring.board.review.model.dto.ReviewBoardComment;
import com.tmi.spring.board.review.model.dto.ReviewBoardLove;
import com.tmi.spring.board.review.model.dto.ReviewBoardSearch;
import com.tmi.spring.planner.model.dto.Planner;

public interface ReviewBoardService {

	List<ReviewBoard> selectReviewBoardList(int cPage, int numPerPage);

	int selectTotalContent();
	
	List<ReviewBoardSearch> selectReviewBoardSearchList(int cPage, int numPerPage, String searchType, String keyword);
	
	int selectSearchTotalContent(String searchType, String keyword);
	
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

	List<ReviewBoard> selectBestReviewBoardList(int cPage, int numPerPage);

	List<ReviewBoard> selectMainReviewBoardList(int cPage, int numPerPage);

	Planner findBoardPlannerByNoModel(int no);


}
