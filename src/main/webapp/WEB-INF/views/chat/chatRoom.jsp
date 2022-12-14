<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="utf-8" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Travel Making Imagine" name="title" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/chat.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
<div id="commonMain">
<sec:authentication property="principal" var="loginMember" scope="page"/>
<script>
const loginMemberEmail = '${loginMember.MEmail}';

</script>
<!-- 
	생성 : 최윤서
	작업 : 최윤서
 -->

 	<div class="container">
		<h3 class=" text-center">채팅</h3>
		<div class="messaging">
		      <div class="inbox_msg">
		        <div class="inbox_people">
		        
		          <div class="headind_srch">
		            <div class="recent_heading">
		              <h4>채팅목록</h4>
		            </div>
		          </div>

		          <div class="inbox_chat">
		          	  
		          	  
		          </div>
		        </div>
		        <div class="mesgs">
		          <div class="msg_history">
		            <c:forEach items="${chatContentList}" var="chatContent">
		            <c:if test="${loginMember.MEmail ne chatContent.sendEmail}">
				            <div class="incoming_msg">
				              <div class="received_msg">
				                <div class="received_withd_msg">
				                  <p>${chatContent.messageContent}</p>
				                  <span class="time_date"> ${chatContent.sendEmail} | ${chatContent.messageTime} </span></div>
				              </div>
				            </div>
		            </c:if>
		            <c:if test="${loginMember.MEmail eq chatContent.sendEmail}">
				            <div class="outgoing_msg">
				              <div class="sent_msg">
				                <p>${chatContent.messageContent}</p>
				                <span class="time_date"> ${chatContent.sendEmail} | ${chatContent.messageTime} </span> 
			                  </div>
				            </div>
		            </c:if>
		            </c:forEach>
		             
		          </div>
		          <div class="type_msg">
		            <div class="input_msg_write">
		              <input type="text" class="write_msg" id="msg" placeholder="메세지 보내기" />
		              <button class="msg_send_btn" type="button" onKeyDown="pressEnter()"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
		            </div>
		          </div> 
		        </div>
		      </div>
		    </div>
    </div>
</div>


<script>
function pressEnter(){
    if(event.keyCode == 13){
        alert("엔터키 활성화!");
    }
}
/* 채팅목록리스트 */
setInterval(function() {
	$(document).ready(function(){
		
		$.ajax({
			
			url : `${pageContext.request.contextPath}/chat/roomList.do`,
			data:{
				loginMemberEmail : loginMemberEmail
			},
			contentType : 'application/json;',
			type: "GET",
			success : function(list){
				$('.inbox_chat').html('');
				/* console.log(list);*/
				const chatRoomList = document.querySelector('.inbox_chat');
				for(var i = 0; list.length > i; i++){
					let html = "";
					let contentNo = list[i]['contentNo']
					let roomId = list[i]['chatroomId']
					let receive = list[i]['sendEmail'] == loginMemberEmail ? list[i]['receiveEmail'] : list[i]['sendEmail'];
					let send = list[i]['receiveEmail'] == loginMemberEmail ? list[i]['sendEmail'] : list[i]['receiveEmail'];
					let messageContent = list[i]['messageContent']
					let messageTime = list[i]['messageTime']
					/* console.log(contentNo, roomId, receive, send, messageContent, messageTime); */
					html += `<div class="chat_list" data-room-id=\${roomId} data-room-email=\${receive}>
								 <div class="chat_people">
								     <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
								     <div class="chat_ib">
									     <h5> \${receive} <span class="chat_date">\${messageTime}</span></h5>
									     <p>
									     \${messageContent}
									     <button type="button" class="btn btn-outline-danger" id="deleteChatRoom" style="float:right;font-size:12px;" data-room-id=\${roomId}>나가기</button>
									     </p>
								     </div>
								 </div>
							 </div> `;
					chatRoomList.insertAdjacentHTML('beforeend', html);
				}
				
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
	            alert("Status : " + textStatus);
	            alert("Error : " + errorThrown);
	        }
		});
	});
}, 1000);

/* 채팅방 삭제 */
$(document).on('click', '#deleteChatRoom', function(){
	var chatroomId = $(this).data('roomId');
	console.log(chatroomId);
	
	if(confirm("상대방의 채팅방도 나가집니다. 나가시겠습니까?")){
		$.ajax({
			
			url : `${pageContext.request.contextPath}/chat/deleteChatRoom.do`,
			data : {
				chatroomId : chatroomId
			},
			contentType : 'application/jason;',
			type : "GET",
			success(response){
				console.log(response);
				alert(response.msg);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
	            alert("Status : " + textStatus);
	            alert("Error : " + errorThrown);
			}
		});
	}
});

/* 목록 선택시 */
$(document).on('click', '.chat_list', function(){
    var chatroomId = $(this).data('roomId');
    var receiveEmail = $(this).data('roomEmail');
    /* console.log(chatroomId, receiveEmail); */
    
    $.ajax({
    	
    	url : `${pageContext.request.contextPath}/chat/room.do`,
    	data : {
    		chatroomId : chatroomId
    	},
    	contentType : 'application/jason;',
    	type : "GET",
    	success : function(list){
    		/* console.log(list); */
    		$('.msg_history').html('');
    		const container = document.querySelector('.msg_history');
    		for(var i = 0; list.length > i; i++){
    			let html = "";
				let contentNo = list[i]['contentNo']
				let chatroomId = list[i]['chatroomId']
				let receiveEmail = list[i]['sendEmail'] == loginMemberEmail ? list[i]['receiveEmail'] : list[i]['sendEmail'];
				let sendEmail = list[i]['receiveEmail'] == loginMemberEmail ? list[i]['receiveEmail'] : list[i]['sendEmail'];
				let messageContent = list[i]['messageContent']
				let messageTime = list[i]['messageTime']
				/* console.log(contentNo, chatroomId, receiveEmail, sendEmail, messageContent, messageTime); */
				
			    html +=`<div class="outgoing_msg">
			               <div class="sent_msg">
			                 <p>\${messageContent}</p>
			                 <span class="time_date"> \${sendEmail} | \${messageTime} </span> 
		                   </div>
			           </div>
					   <div class="incoming_msg">
			               <div class="received_msg">
			                 <div class="received_withd_msg">
			                   <p>\${messageContent}</p>
			                   <span class="time_date"> ${receiveEmail} | \${messageTime} </span></div>
			               </div>
		               </div>`;
		               
				container.insertAdjacentHTML('beforeend', html);
    		};
    	},
    	error : function(XMLHttpRequest, textStatus, errorThrown) {
            alert("Status : " + textStatus);
            alert("Error : " + errorThrown);
        }
    });
});

const chatroomId = '${chatroomId}';
const sendEmail = '${loginMember.MEmail}';
const receiveEmail = '${receiveEmail}';
/* 
console.log("chatroomId = " + chatroomId);
console.log("sendEmail = " + sendEmail);
console.log("receiveEmail = " + receiveEmail); 
*/
</script>
<script src="${pageContext.request.contextPath}/resources/js/chat.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>