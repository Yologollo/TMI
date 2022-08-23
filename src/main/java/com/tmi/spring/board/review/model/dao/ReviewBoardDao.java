package com.tmi.spring.board.review.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.tmi.spring.board.review.model.dto.InsertReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoardAttachment;
import com.tmi.spring.board.review.model.dto.ReviewBoardComment;
import com.tmi.spring.board.review.model.dto.ReviewBoardSearch;
import com.tmi.spring.planner.model.dto.Planner;
import com.tmi.spring.planner.model.dto.PlannerPlan;

@Mapper
public interface ReviewBoardDao {

	List<ReviewBoard> selectReviewBoardList(RowBounds rowBounds);

	@Select("select count(*) from tmi_review_board")
	int selectTotalContent();
	
	List<ReviewBoardSearch> selectReviewBoardSearchList(RowBounds rowBounds, Map<String, String> map);

	int selectSearchTotalContent(Map<String, String> map);

	int insertReviewBoard(InsertReviewBoard insertReviewBoard);
	
	int insertAttachment(ReviewBoardAttachment attach);
	
	@Select("select * from tmi_review_board where rb_no = #{no}")
	InsertReviewBoard selectOneReviewBoard(int no);

	@Select("select * from tmi_review_board_attachment where rba_rb_no = #{no}")
	List<ReviewBoardAttachment> selectAttachmentListByNo(int no);

	@Select("select * from tmi_review_board_attachment where rba_no = #{attachNo}")
	ReviewBoardAttachment selectOneAttachment(int attachNo);

	@Delete("delete from tmi_review_board_attachment where rba_no = #{attachNo}")
	int deleteAttachment(int attachNo);

	@Update("update tmi_review_board set rb_p_no = #{rbPNo}, rb_title = #{rbTitle}, rb_content = #{rbContent}, rb_updated_at = sysdate where rb_no = #{rbNo}")
	int updateReviewBoard(InsertReviewBoard insertReviewBoard);

	@Delete("delete from tmi_review_board where rb_no = #{no}")
	int deleteReviewBoard(int no);

	int insertReviewComment(ReviewBoardComment rbComment);
	
	@Select("select * from tmi_review_board_comment where rbc_rb_no = #{no}")
	List<ReviewBoardComment> findBoardCommentByNo(int no);

	@Delete("delete from tmi_review_board_comment where rbc_no = #{rbcNo}")
	int deleteReviewBoardComment(int rbcNo);

	@Update("update tmi_review_board set rb_read_count = rb_read_count + 1 where rb_no = #{no}")
	int updateReadCount(int no);

	int insertLove(@Param("loNo") int loNo, @Param("email") String email);

	@Select("select rbl_type from tmi_review_board_love where rbl_rb_no = #{loNo} and rbl_m_email = #{email}")
	String selectFindLove(@Param("loNo")int loNo, @Param("email") String email);

	
	@Select("select count(*) from tmi_review_board_love where rbl_rb_no = #{no}")
	int loveCount(int no);

	List<ReviewBoard> selectBestReviewBoardList(RowBounds rowBounds);

	List<ReviewBoard> selectMainReviewBoardList(RowBounds rowBounds);

	@Select("select rb_no, p_no, p_title, p_explan, p_leave_date, p_return_date from tmi_review_board rb join tmi_planner p on rb.rb_p_no = p.p_no where rb_no = #{no}")
	List<Planner> findBoardPlannerByNo(int no);

	@Select("select pp_no, pp_p_no, pp_time, pp_place_name, pp_memo, pp_x, pp_y, pp_date from tmi_review_board rb, tmi_planner p, tmi_planner_plan pp where rb.rb_p_no = p.p_no and p.p_no = pp.pp_p_no and rb.rb_no =  #{no}")
	List<PlannerPlan> findBoardPlanByNo(int no);

	@Select("select p_leave_date, p_return_date from tmi_review_board rb join tmi_planner p on rb.rb_p_no = p.p_no where rb_no = #{no}")
	Planner findBoardPlannerByNoModel(int no);

}
