<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="utf-8" />
<!-- 	
	생성 : 권민지
	작업 : 권민지
 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="상세보기" name="title" />
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">

<style>
	#fb_content {
		resize : none;
	}
	
	#save {
		margin-left :45%;
	}
	
	#downloadFile {
		width : 100%;
	}
	
	.btn-lg {
		margin-left :1%;
	    border-color: #70B9E9;
	    font-weight: 700;
	    background-color: #70B9E9;
	    color: white;
	 }
	 	 
	  #noticeFrmbt{
	  text-align: center;
	   margin-top: 550px;
	  }
	  
	 #commonMain no {
	  text-align: center;
	  }
	  
  	.btn {
	   	border-color: #70B9E9;
	   	font-weight: 700;
	   	background-color: #70B9E9;
	   	color: white;
	}
	
	#commonMain{
	    overflow: hidden;
	    position: relative;
	    box-shadow: 1px 1px 3px 1px #dadce0;
	    border-bottom-right-radius: 30px;
	    border-bottom-left-radius: 30px;
	}
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember" scope="page"/>
	<script>const mEmail = '${loginMember.MEmail}';</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${pageContext.request.contextPath}/resources/js/ws.js"></script>
</sec:authorize>

<div id="commonMain">
 		<h1>공지사항</h1>
		<input type="hidden" class="form-control" name="nbNo" id="no" value="${insertNoticeBoard.nbNo}" required>
		<input type="text" class="form-control" name="nbTitle" id="title" style="font-size : 40px" value="${insertNoticeBoard.nbTitle}" required readonly>
 		<input type="text" class="form-control" name="nbMEmail" value="${insertNoticeBoard.nbMEmail}" readonly required>
		<label class="input-group-text" for="inputGroupFile01">첨부파일</label>
			<c:if test="${not empty insertNoticeBoard.attachments}">
				<c:forEach items="${insertNoticeBoard.attachments}" var="attach">
					<div class="btn-group-toggle pb-1" data-toggle="buttons">
						<button type="button" id="downloadFile" class="btn btn-outline-success attach" value="${attach.nbaNo}">${attach.nbaOriginalFilename}</button>
					</div>
				</c:forEach>
			</c:if>
		<div id="contentMain" style="text-align : center">
	  	${insertNoticeBoard.nbContent} 
	  	</div>
	
		<c:if test="${not empty loginMember}">
			<div class="comment-container">
		        <div class="comment-editor"></div>
		</c:if>
					
	<div id=noticeFrmbt style="margin-bottom : 20px">
		<c:if test="${(not empty loginMember && (loginMember.MEmail eq insertNoticeBoard.nbMEmail)) || (loginMember.MEmail eq 'admin@naver.com')}">
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeBoardUpdate.do?no=${insertNoticeBoard.nbNo}';">수정</button>
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeBoardDelete.do?no=${insertNoticeBoard.nbNo}';">삭제</button>
		</c:if>
		
		<input type="submit" class="btn btn-primary btn-lg" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeBoard.do'">
		
	</div> 	
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
 			location.href = `${pageContext.request.contextPath}/admin/notice/fileDownload.do?no=\${attachNo}`;
 		});
 	});
 	
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