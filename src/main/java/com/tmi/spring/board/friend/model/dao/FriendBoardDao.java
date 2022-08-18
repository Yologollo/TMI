package com.tmi.spring.board.friend.model.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.tmi.spring.board.friend.model.dto.FriendBoard;
import com.tmi.spring.board.friend.model.dto.FriendBoardAttachment;
import com.tmi.spring.board.friend.model.dto.FriendBoardComment;
import com.tmi.spring.board.friend.model.dto.InsertFriendBoard;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;

@Mapper
public interface FriendBoardDao {

	List<FriendBoard> selectFriendBoardList(RowBounds rowBounds);

	@Select("select count(*) from tmi_friend_board")
	int selectTotalContent();

	int insertFriendBoard(InsertFriendBoard insertFriendBoard);

	int insertAttachment(FriendBoardAttachment attach);
	
//	@Select("select * from tmi_friend_board fb join tmi_planner p on fb.fb_p_no = p.p_no where fb_no = #{no}")
//	InsertFriendBoard selectOneFriendBoard(int no);
	
	@Select("select * from tmi_friend_board where fb_no = #{no}")
	InsertFriendBoard selectOneFriendBoard(int no);

	@Select("select * from tmi_friend_board_attachment where fba_fb_no = #{no}")
	List<FriendBoardAttachment> selectAttachmentListByNo(int no);

	@Select("select * from tmi_friend_board_attachment where fba_no = #{attachNo}")
	FriendBoardAttachment selectOneAttachment(int attachNo);

	@Delete("delete from tmi_friend_board_attachment where fba_no = #{attachNo}")
	int deleteAttachment(int attachNo);

	@Update("update tmi_friend_board set fb_p_no = #{fbPNo}, fb_title = #{fbTitle}, fb_content = #{fbContent}, fb_updated_at = sysdate where fb_no = #{fbNo}")
	int updateFriendBoard(InsertFriendBoard insertFriendBoard);

	@Delete("delete from tmi_friend_board where fb_no = #{no}")
	int deleteFriendBoard(int no);

	int insertFriendComment(FriendBoardComment fbComment);

	@Select("select * from tmi_friend_board_comment where fbc_fb_no = #{no}")
	List<FriendBoardComment> findBoardCommentByNo(int no);

	@Delete("delete from tmi_friend_board_comment where fbc_no = #{fbcNo}")
	int deleteFriendBoardComment(int fbcNo);

	@Update("update tmi_friend_board set fb_read_count = fb_read_count + 1 where fb_no = #{no}")
	int updateReadCount(int no);

	@Select("select fb_no, p_no, p_title, p_explan, p_leave_date, p_return_date from tmi_friend_board fb join tmi_planner p on fb.fb_p_no = p.p_no where fb_no = #{no}")
	List<Planner> findBoardPlannerByNo(int no);

	@Select("select pp_no, pp_p_no, pp_time, pp_place_name, pp_memo, pp_x, pp_y, pp_date from tmi_friend_board fb, tmi_planner p, tmi_planner_plan pp where fb.fb_p_no = p.p_no and p.p_no = pp.pp_p_no and fb.fb_no =  #{no}")
	List<PlannerPlan> findBoardPlanByNo(int no);

	@Select("select p_leave_date, p_return_date from tmi_friend_board fb join tmi_planner p on fb.fb_p_no = p.p_no where fb_no = #{no}")
	Planner findBoardPlannerByNoModel(int no);

}
