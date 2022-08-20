package com.tmi.spring.board.planner.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.tmi.spring.board.planner.model.dto.InsertPlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoard;
import com.tmi.spring.board.planner.model.dto.PlannerBoardComment;
import com.tmi.spring.board.review.model.dto.ReviewBoardComment;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;

@Mapper
public interface PlannerBoardDao {

	List<PlannerBoard> selectPlannerBoardList(RowBounds rowBounds);

	@Select("select count(*) from tmi_planner_board")
	int selectTotalContent();

	@Select("select * from tmi_planner_board where pb_no = #{no}")
	InsertPlannerBoard selectOneReviewBoard(int no);

	@Select("select * from tmi_planner_board_comment where pbc_pb_no = #{no}")
	List<PlannerBoardComment> findBoardCommentByNo(int no);

	@Update("update tmi_planner_board set pb_read_count = pb_read_count + 1 where pb_no = #{no}")
	int updateReadCount(int no);

	@Select("select count(*) from tmi_planner_board_love where pbl_pb_no = #{no}")
	int loveCount(int no);
	//-------------------------

	@Delete("delete from tmi_planner_board where pb_no = #{no}")
	int deletePlannerBoard(int no);

	@Delete("delete from tmi_planner_board_comment where pbc_no = #{pbcNo}")
	int deletePlannerBoardComment(int pbcNo);

	int insertLove(@Param("loNo") int loNo, @Param("email") String email);

	int insertPlannerBoard(InsertPlannerBoard insertPlannerBoard);

	int insertPlannerComment(PlannerBoardComment pbComment);

	@Select("select pbl_type from tmi_planner_board_love where pbl_pb_no = #{loNo} and pbl_m_email = #{email}")
	String selectFindLove(@Param("loNo")int loNo, @Param("email") String email);

	@Update("update tmi_planner_board set pb_p_no = #{pbPNo}, pb_title = #{pbTitle}, pb_content = #{pbContent}, pb_updated_at = sysdate where pb_no = #{pbNo}")
	int updatePlannerBoard(InsertPlannerBoard insertPlannerBoard);

	@Select("select p_leave_date, p_return_date from tmi_planner_board pb join tmi_planner p on pb.pb_p_no = p.p_no where pb_no = #{no}")
	Planner findBoardPlannerByNoModel(int no);

	@Select("select pb_no, p_no, p_title, p_explan, p_leave_date, p_return_date from tmi_planner_board pb join tmi_planner p on pb.pb_p_no = p.p_no where pb_no = #{no}")
	List<Planner> findBoardPlannerByNo(int no);

	@Select("select pp_no, pp_p_no, pp_time, pp_place_name, pp_memo, pp_x, pp_y, pp_date from tmi_planner_board pb, tmi_planner p, tmi_planner_plan pp where pb.pb_p_no = p.p_no and p.p_no = pp.pp_p_no and pb.pb_no = #{no}")
	List<PlannerPlan> findBoardPlanByNo(int no);

}
