package com.tmi.spring.admin.notice.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.tmi.spring.admin.notice.model.dto.NoticeBoard;

@Mapper
public interface NoticeBoardDao {
 
	List<NoticeBoard> selectNoticeBoardList(RowBounds rowBounds);

}
