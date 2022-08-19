package com.tmi.spring.admin.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.tmi.spring.admin.model.dto.AdminList;

@Mapper
public interface AdminListDao {

	List<AdminList> selectAdminList(RowBounds rowBounds);

}
