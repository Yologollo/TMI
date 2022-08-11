package com.tmi.spring.board.friend.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.tmi.spring.board.friend.model.dto.FriendBoard;
import com.tmi.spring.board.friend.model.dto.FriendBoardAttachment;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;

@Mapper
public interface FriendBoardDao {

	List<FriendBoard> selectFriendBoardList(RowBounds rowBounds);

	@Select("select count(*) from tmi_friend_board")
	int selectTotalContent();

	int insertFriendBoard(InsertFriendBoard insertFriendBoard);

	int insertAttachment(FriendBoardAttachment attach);
	
	@Select("select * from tmi_friend_board where fb_no = #{no}")
	InsertFriendBoard selectOneFriendBoard(int no);
//	Map<String, Object> selectOneFriendBoard(int no);

	@Select("select * from tmi_friend_board_attachment where fba_fb_no = #{no}")
	List<FriendBoardAttachment> selectAttachmentListByNo(int no);

	@Select("select * from tmi_friend_board_attachment where fba_no = #{attachNo}")
	FriendBoardAttachment selectOneAttachment(int attachNo);

	@Delete("delete from tmi_friend_board_attachment where fba_no = #{attachNo}")
	int deleteAttachment(int attachNo);

	@Update("update tmi_friend_board set fb_title = #{fbTitle}, fb_content = #{fbContent}, fb_updated_at = sysdate where fb_no = #{fbNo}")
	int updateFriendBoard(InsertFriendBoard insertFriendBoard);

	@Delete("delete from tmi_friend_board where fb_no = #{no}")
	int deleteFriendBoard(int no);
	
	

}
