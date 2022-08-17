package com.tmi.spring.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.tmi.spring.chat.model.dto.ChatContent;
import com.tmi.spring.chat.model.dto.ChatRoom;

/**
 * 
 * @생성 최윤서
 * @작업 최윤서
 *
 */

@Mapper
public interface ChatDao {
	// 채팅방 생성
//	@Insert("insert into tmi_chat_room (cr_id, cr_m_email, cr_fb_no) values (#{crId}, #{crMEmail}, #{crFbNo})")
//	int insertChatMember(ChatRoom chatMember);

	// 채팅방 생성전에 해당 회원과 채팅이력이 있는지 확인
//	@Select("select * from tmi_chat_room where cr_fb_no = #{boardNo} and cr_m_email = #{sendEmail}")
//	ChatRoom findChatMemberId(@Param("sendEmail") String receiveEmail, @Param("boardNo") int boardNo);

	List<ChatContent> findRecentChatLogList(String mEmail);

	List<ChatContent> findChatContentByReceiveEmail(@Param("CcCrId")String CcCrId, @Param("CcMEmail")String CcMEmail);

	List<ChatContent> findChatContentBySendEmail(@Param("CcCrId")String CcCrId, @Param("CcMEmail")String CcMEmail);
//
	// 채팅방 생성
	@Insert("insert into tmi_chat_room (chatroom_id, send_email, receive_email) values (#{chatroomId}, #{sendEmail}, #{receiveEmail})")
	int createChatRoom(@Param("chatroomId") String chatroomId, @Param("sendEmail") String sendEmail, @Param("receiveEmail") String receiveEmail);

	// 채팅방 존재여부확인
	@Select("select * from tmi_chat_room where send_email = #{sendEmail} and receive_email = #{receiveEmail}")
	ChatRoom findChatRoomByMemberReceiveEmail(@Param("sendEmail")String sendEmail, @Param("receiveEmail") String receiveEmail);

	// 채팅방 존재여부확인
	@Select("select * from tmi_chat_room where send_email = #{sendEmail} and receive_email = #{receiveEmail}")
	ChatRoom findChatRoomByMemberSendEmail(@Param("sendEmail")String sendEmail, @Param("receiveEmail") String receiveEmail);

	// stomp를 통해 메세지 보내면 db에 저장
	@Insert("insert into tmi_chat_content values (seq_content_no.nextval, #{chatroomId}, #{sendEmail}, #{receiveEmail}, #{msg}, to_date((#{time}), 'YYYY-MM-DD HH24:MI:SS'))")
	int insertChatContentSend(Map<String, Object> payload);

	// 메세지 내용불러오기
	@Select("select * from tmi_chat_content where chatroom_id = #{chatroomId} order by content_no")
	List<ChatContent> findChatContentByChatRoomId(String chatroomId);

	// 채팅방 목록 조회하기
	@Select("select * from(select cc.*,row_number() over(partition by chatroom_id order by message_time desc) rnum from tmi_chat_content cc where send_email= #{loginMemberEmail} or receive_email = #{loginMemberEmail}) cc where rnum = 1 order by message_time desc")
	List<ChatContent> findRecentChatRoomList(String loginMemberEmail);
}
