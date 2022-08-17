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
<input type="hidden" class="form-control" name="loginMemberEmail" id="loginMemberEmail" value="${loginMember.MEmail}" required readonly>

<script>
const email = document.getElementById("loginMemberEmail").value;
</script>

<div id="commonMain">
		<input type="hidden" class="form-control" name="loginMemberEmail" id="loginMemberEmail" value="${loginMember.MEmail}" required readonly>
		<input type="hidden" class="form-control" name="rbNo" id="no" value="${insertReviewBoard.rbNo}" required>
		<input type="text" class="form-control" name="rbTitle" id="title" value="${insertReviewBoard.rbTitle}" required readonly>
 		<input type="text" class="form-control" name="rbMEmail" value="${insertReviewBoard.rbMEmail}" readonly required>
		
		<label class="input-group-text" for="inputGroupFile01">첨부파일</label>
			<c:if test="${not empty insertReviewBoard.attachments}">
				<c:forEach items="${insertReviewBoard.attachments}" var="attach">
					<div class="btn-group-toggle pb-1" data-toggle="buttons">
						<button type="button" id="downloadFile" class="btn btn-outline-success attach" value="${attach.rbaNo}">${attach.rbaOriginalFilename}</button>
					</div>
				</c:forEach>
			</c:if>
		
	  	${insertReviewBoard.rbContent} <!-- summernote 출력 -->
		<br /><br />
		<hr />
		
		<%-- <c:if test="${not empty loginMember && (loginMember.MEmail eq insertFriendBoard.fbMEmail)}"> --%>
		<c:if test="${not empty loginMember}">
			<div class="comment-container">
		        <div class="comment-editor">
		            <form
						action="${pageContext.request.contextPath}/board/review/reviewBoardCommentEnroll.do" method="post" name="reviewBoardCommentFrm">
		                <input type="hidden" name="rbcFbNo" value="${insertReviewBoard.rbNo}" />
		                <input type="hidden" name="rbcMEmail" value="${loginMember != null ? loginMember.MEmail : ""}" />
						<textarea name="rbcContent" cols="100" rows="3"></textarea>
		                <button type="submit" class="btn btn-primary btn-lg">등록</button>
		            </form>
		        </div>
		</c:if>
		
		<div>
			<a class="text-dark heart" style="text-decoration-line: none;">
				<img id="heart" src="${pageContext.request.contextPath}/resources/images/noImage.png">
				좋아요
			</a>
		</div>
				<!--table#tbl-comment-->
				 <c:if test="${insertReviewBoard.comments ne null && not empty insertReviewBoard.comments}">
					<table id="tbl-comment">
						<tbody>
						<c:forEach items="${insertReviewBoard.comments}" var="comment">
							<tr class="level1">
								<td>
									<sub class="comment-writer">${comment.rbcMEmail}</sub>
									<sub class="comment-date">${comment.rbcCreatedAt}</sub>
									<br />
									${comment.rbcContent}
								</td>
								
								<td>
									<form action="${pageContext.request.contextPath}/board/review/deleteComment.do" method="get" name="reviewBoardCommentDeleteFrm">
										<input type="hidden" name="rbcFbNo" value="${insertReviewBoard.rbNo}" />
										<input type="hidden" name="rbcNo" value="${comment.rbcNo}" />
										<c:if test="${(not empty loginMember && (loginMember.MEmail eq comment.rbcMEmail)) || (loginMember.MEmail eq 'admin@naver.com')}">
					                		<button type="submit" id="deleteComment" class="">삭제</button>
					                	</c:if>
									</form>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				 </c:if> 
		
		<c:if test="${(not empty loginMember && (loginMember.MEmail eq insertReviewBoard.rbMEmail)) || (loginMember.MEmail eq 'admin@naver.com')}">
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/review/reviewBoardUpdate.do?no=${insertReviewBoard.rbNo}';">수정</button>
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/review/reviewBoardDelete.do?no=${insertReviewBoard.rbNo}';">삭제</button>
		</c:if>
		
		<input type="submit" class="btn btn-primary btn-lg" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/board/review/reviewBoard.do'">
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
 			location.href = `${pageContext.request.contextPath}/board/review/fileDownload.do?no=\${attachNo}`;
 		});
 	});

 	document.reviewBoardCommentFrm.onsubmit = (e) => {
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





