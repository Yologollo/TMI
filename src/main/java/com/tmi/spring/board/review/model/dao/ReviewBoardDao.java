package com.tmi.spring.board.review.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.tmi.spring.board.review.model.dto.InsertReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoard;
import com.tmi.spring.board.review.model.dto.ReviewBoardAttachment;
import com.tmi.spring.board.review.model.dto.ReviewBoardComment;
import com.tmi.spring.board.review.model.dto.ReviewBoardLove;

@Mapper
public interface ReviewBoardDao {

	List<ReviewBoard> selectReviewBoardList(RowBounds rowBounds);

	@Select("select count(*) from tmi_review_board")
	int selectTotalContent();

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

	@Update("update tmi_review_board set rb_title = #{rbTitle}, rb_content = #{rbContent}, rb_updated_at = sysdate where rb_no = #{rbNo}")
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

	int insertLove(ReviewBoardLove love);
	
}
