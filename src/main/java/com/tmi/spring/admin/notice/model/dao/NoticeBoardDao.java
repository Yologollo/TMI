package com.tmi.spring.admin.notice.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.tmi.spring.admin.notice.model.dto.InsertNoticeBoard;
import com.tmi.spring.admin.notice.model.dto.NoticeBoard;
import com.tmi.spring.admin.notice.model.dto.NoticeBoardAttachment;


@Mapper
public interface NoticeBoardDao {
 
	List<NoticeBoard> selectNoticeBoardList(RowBounds rowBounds);

	@Select("select count(*) from tmi_notice_board")
	int selectTotalContent();
	
	int insertNoticeBoard(InsertNoticeBoard insertNoticeBoard);

	
	int insertAttachment(NoticeBoardAttachment attach);
	
	@Select("select * from tmi_notice_board where nb_no = #{no}")
	InsertNoticeBoard selectOneNoticeBoard(int no);
	
	@Select("select * from tmi_notice_board_attachment where nba_nb_no = #{no}")
	List<NoticeBoardAttachment> selectAttachmentListByNo(int no);
	
	@Select("select * from tmi_notice_board_attachment where nba_no = #{attachNo}")
	NoticeBoardAttachment selectOneAttachment(int attachNo);

	@Delete("delete from tmi_notice_board_attachment where nba_no = #{attachNo}")
	int deleteAttachment(int attachNo);
	
	@Update("update tmi_notice_board set nb_title = #{nbTitle}, nb_content = #{nbContent}, nb_update_at = sysdate where nb_no = #{nbNo}")
	int updateNoticeBoard(InsertNoticeBoard insertNoticeBoard);
	
	@Delete("delete from tmi_notice_board where nb_no = #{no}")
	int deleteNoticeBoard(int no);
	
	@Update("update tmi_notice_board set nb_read_count = nb_read_count + 1 where nb_no = #{no}")
	int updateReadCount(int no);
}
