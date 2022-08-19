package com.tmi.spring.board.planner.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.tmi.spring.board.planner.model.dto.InsertPlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoardComment;

@Mapper
public interface PlannerBoardDao {

	List<PlannerBoard> selectPlannerBoardList(RowBounds rowBounds);

	@Select("select count(*) from tmi_planner_board")
	int selectTotalContent();

	@Select("select * from tmi_planner_board where pb_no = #{no}")
	InsertPlannerBoard selectOneReviewBoard(int no);

	@Select("select * from tmi_planner_board_comment where pbc_pb_no = #{no}")
	List<ReviewBoardComment> findBoardCommentByNo(int no);

	@Update("update tmi_planner_board set pb_read_count = pb_read_count + 1 where pb_no = #{no}")
	int updateReadCount(int no);

	@Select("select count(*) from tmi_planner_board_love where pbl_pb_no = #{no}")
	int loveCount(int no);

}
