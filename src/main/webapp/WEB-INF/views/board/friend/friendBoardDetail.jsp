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

		 <sec:authorize access="isAuthenticated()">
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoardUpdate.do?no=${insertFriendBoard.fbNo}';">수정</button>
			<button type="button" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoardDelete.do?no=${insertFriendBoard.fbNo}';">삭제</button>
		 </sec:authorize> 

		
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
</script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>





