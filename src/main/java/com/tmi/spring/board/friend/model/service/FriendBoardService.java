package com.tmi.spring.board.friend.model.service;

import java.util.List;

import com.tmi.spring.board.friend.model.dto.FriendBoard;
import com.tmi.spring.board.friend.model.dto.FriendBoardAttachment;
import com.tmi.spring.board.friend.model.dto.FriendBoardComment;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;
import com.tmi.spring.planner.model.dto.Planner;

public interface FriendBoardService {

	List<FriendBoard> selectFriendBoardList(int cPage, int numPerPage);

	int selectTotalContent();

	int insertFriendBoard(InsertFriendBoard insertFriendBoard);

	InsertFriendBoard selectOneFriendBoard(int no);

	FriendBoardAttachment selectOneAttachment(int attachNo);

	int deleteAttachment(int attachNo);

	int updateFriendBoard(InsertFriendBoard insertFriendBoard);

	int deleteFriendBoard(int no);

	int insertFriendComment(FriendBoardComment fbComment);

	int deleteFriendBoardComment(int fbcNo);

	int updateReadCount(int no);

	Planner findBoardPlannerByNoModel(int no);

}
