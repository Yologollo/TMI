package com.tmi.spring.admin.notice.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
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


}
