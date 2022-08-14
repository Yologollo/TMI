<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="utf-8" />
<!-- 
	생성 : 이경석
	작업 : 이경석
 -->

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="상세보기" name="title" />
</jsp:include>
<!-- include libraries(jQuery, bootstrap) -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<style>
	#fb_content {
		resize : none;
		overflow-y:scroll;
	}
	#save {
		margin-left :45%;
	}
	#downloadFile {
		width : 100%;
	}
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember" scope="page"/>
	<script>
		const mEmail = '${loginMember.MEmail}';
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${pageContext.request.contextPath}/resources/js/ws.js"></script>
</sec:authorize>

<div id="commonMain">
		<input type="hidden" class="form-control" name="fbNo" id="no" value="${insertFriendBoard.fbNo}" required>
		<input type="text" class="form-control" name="fbTitle" id="title" value="${insertFriendBoard.fbTitle}" required readonly>
 		<input type="text" class="form-control" name="fbMEmail" value="${insertFriendBoard.fbMEmail}" readonly required>
		
		<label class="input-group-text" for="inputGroupFile01">첨부파일</label>
			<c:if test="${not empty insertFriendBoard.attachments}">
				<c:forEach items="${insertFriendBoard.attachments}" var="attach">
					<div class="btn-group-toggle pb-1" data-toggle="buttons">
						<button type="button" id="downloadFile" class="btn btn-outline-success attach" value="${attach.fbaNo}">${attach.fbaOriginalFilename}</button>
					</div>
				</c:forEach>
			</c:if>
		
	  	${insertFriendBoard.fbContent} <!-- summernote 출력 -->
		<br /><br />
		<hr />
		
		<%-- <c:if test="${not empty loginMember && (loginMember.MEmail eq insertFriendBoard.fbMEmail)}"> --%>
		<c:if test="${not empty loginMember}">
			<div class="comment-container">
		        <div class="comment-editor">
		            <form
						action="${pageContext.request.contextPath}/board/friend/friendBoardCommentEnroll.do" method="post" name="friendBoardCommentFrm">
		                <input type="hidden" name="fbcFbNo" value="${insertFriendBoard.fbNo}" />
		                <input type="hidden" name="fbcMEmail" value="${loginMember != null ? loginMember.MEmail : ""}" />
						<textarea name="fbcContent" cols="100" rows="3"></textarea>
		                <button type="submit" class="btn btn-primary btn-lg">등록</button>
		            </form>
		        </div>
		</c:if>
				<!--table#tbl-comment-->
				 <c:if test="${insertFriendBoard.comments ne null && not empty insertFriendBoard.comments}">
					<table id="tbl-comment">
						<tbody>
						<c:forEach items="${insertFriendBoard.comments}" var="comment">
							<tr class="level1">
								<td>
									<sub class="comment-writer">${comment.fbcMEmail}</sub>
									<sub class="comment-date">${comment.fbcCreatedAt}</sub>
									<br />
									${comment.fbcContent}
								</td>
								<td>
									<form action="${pageContext.request.contextPath}/board/friend/deleteComment.do" method="get" name="friendBoardCommentDeleteFrm">
										<input type="hidden" name="fbcFbNo" value="${insertFriendBoard.fbNo}" />
										<input type="hidden" name="fbcNo" value="${comment.fbcNo}" />
										<c:if test="${(not empty loginMember && (loginMember.MEmail eq comment.fbcMEmail)) || (loginMember.MEmail eq 'admin@naver.com')}">
					                		<button type="submit" id="deleteComment" class="">삭제</button>
					                	</c:if>
									</form>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				 </c:if> 
			</div>
		
		<c:if test="${(not empty loginMember && (loginMember.MEmail eq insertFriendBoard.fbMEmail)) || (loginMember.MEmail eq 'admin@naver.com')}">
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoardUpdate.do?no=${insertFriendBoard.fbNo}';">수정</button>
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoardDelete.do?no=${insertFriendBoard.fbNo}';">삭제</button>
		</c:if>
		
		<input type="submit" class="btn btn-primary btn-lg" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoard.do'">
		<br /><br /><br />
</div>
<script>
	document.querySelectorAll("[name=upFile]").forEach((input) => {
		input.addEventListener('change', (e) => {
			const [file] = e.target.files;
			console.log(file);
		});
	});

 	$('#summernote').summernote({
		tabsize: 1, // 줄바꿈 간격
		height: 700, // 노트 크기
		disableResizeEditor: true, // 노트 크기 고정
		lang: "ko-KR",
		toolbar: [ // 상세보기에서는 툴바 삭제
			[],
			[],
			[],
			[],
			[],
			[],
			[]
		]
	}); 
 	
 	document.querySelectorAll(".attach").forEach((btn) => {
 		btn.addEventListener("click", (e) => {
 			const attachNo = e.target.value;
 			console.log(attachNo);
 			location.href = `${pageContext.request.contextPath}/board/friend/fileDownload.do?no=\${attachNo}`;
 		});
 	});

 	document.friendBoardCommentFrm.onsubmit = (e) => {
 		const contentVal = e.target.fbcContent.value.trim();
 		if(!/^(.|\n)+$/.test(contentVal))
 		{
 			alert("댓글 내용을 입력하세요.");
 			return false;
 		}
 	};
 	
  	document.querySelectorAll("#deleteComment").forEach((del) => {
 		del.addEventListener("click", (e) => {		
 			if(!confirm("삭제하시겠습니까?"))
 			{
 				e.preventDefault();			
 			}
 		});
 	}); 

</script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>





