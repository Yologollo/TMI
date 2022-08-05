package com.tmi.spring.board.friend.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.tmi.spring.board.friend.model.dto.FriendBoard;

@Mapper
public interface FriendBoardDao {

	List<FriendBoard> selectFriendBoardList(RowBounds rowBounds);

	@Select("select count(*) from tmi_friend_board")
	int selectTotalContent();

}
