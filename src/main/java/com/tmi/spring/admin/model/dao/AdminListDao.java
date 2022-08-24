package com.tmi.spring.admin.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import com.tmi.spring.admin.model.dto.AdminList;
import com.tmi.spring.member.model.dto.Member;

@Mapper
public interface AdminListDao {

	List<AdminList> selectAdminList(RowBounds rowBounds);
	
	@Select("select count(*) from tmi_member")
	int selectTotalContent();
	
	@Delete("delete from tmi_member where m_email = #{memberEmail}")
	int memeberDelete(@Param("memberEmail") String memberEmail);

	@Select("select * from tmi_member where m_name like '%'||#{memberName}||'%'")
	List<Member> memberListSearch(String memberName);

}
