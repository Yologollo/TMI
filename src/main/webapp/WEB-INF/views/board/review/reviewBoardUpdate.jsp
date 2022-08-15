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
	<jsp:param value="게시글 수정" name="title" />
</jsp:include>
<!-- include libraries(jQuery, bootstrap) -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<style>
	#content {
		resize : none;
		overflow-y:scroll;
	}
	#save {
		margin-left :45%;
	}
</style>
<div id="commonMain">
 	<form:form name="boardFrm" action="${pageContext.request.contextPath}/board/review/reviewBoardUpdate.do" method="POST" enctype="multipart/form-data">
		<input type="hidden" class="form-control" name="rbNo" id="no" value="${insertReviewBoard.rbNo}" required>
		<input type="text" class="form-control" name="rbTitle" id="title" value="${insertReviewBoard.rbTitle}" required>
		<input type="text" class="form-control" name="rbMEmail" value="<sec:authentication property="principal.mEmail"/>" readonly required>
		
		<c:if test="${not empty insertReviewBoard.attachments}">
			<c:forEach items="${insertReviewBoard.attachments}" var="attach" varStatus="vs">
				<div class="btn-group-toggle pb-1" data-toggle="buttons">
	            	<label class="btn btn-outline-danger btn-block" title="${attach.rbaOriginalFilename} 삭제">
	                	<input type="checkbox" id="delFile${vs.count}" name="delFile" value="${attach.rbaNo}">
						<c:if test="${fn:length(attach.rbaOriginalFilename) ge 30}">
							${fn:substring(attach.rbaOriginalFilename, 0, 30)}... 삭제
						</c:if> 
						<c:if test="${fn:length(attach.rbaOriginalFilename) lt 30}">
							${attach.rbaOriginalFilename} 삭제
						</c:if>
	            	</label>
	        	</div>
			</c:forEach>
		</c:if>
		
		<div class="input-group mb-3">
		  <label class="input-group-text" for="inputGroupFile01">Upload</label>
		  <input type="file" name="upFile" class="form-control" id="inputGroupFile01" multiple>
		</div>
		
		<textarea id="summernote" name="rbContent">${insertReviewBoard.rbContent}</textarea>
	  	
		<br /><br />
		<input type="hidden" name="rbNo" value="${insertReviewBoard.rbNo}" />
		<input type="submit" id="save" class="btn btn-primary btn-lg" value="저장" >
		<input type="submit" class="btn btn-primary btn-lg" value="취소" onclick="location.href='${pageContext.request.contextPath}/board/review/reviewBoard.do'">
		<br /><br /><br />
	</form:form>
</div>
<script>
	document.querySelectorAll("[name=upFile]").forEach((input) => {
		input.addEventListener('change', (e) => {
			const [file] = e.target.files;
			console.log(file);
		});
	});

	$('#summernote').summernote({
		placeholder: '내용을 입력하세요.',
		tabsize: 1, // 줄바꿈 간격
		height: 700, // 노트 크기
		disableResizeEditor: true, // 노트 크기 고정
		lang: "ko-KR",
		focus : true, 
		toolbar: [ // 툴바 메뉴들 검색해서 추가 가능
			['style', ['style']],
			['font', ['bold', 'underline', 'clear']],
			['color', ['color']],
			['para', ['ul', 'ol', 'paragraph']],
			['table', ['table']],
			['insert', ['link', 'picture', 'video']],
			['view', ['fullscreen', 'codeview', 'help']]
		]
	});
	
	  
/*  	document.boardFrm.addEventListener('submit', (e) => {
		const title = document.querySelector("#title");
		const content = document.querySelector("#summernote");
	 
		if(!/^.+$/.test(title.value))
		{
			e.preventDefault();
			alert("제목을 작성해주세요.");
			return;
		}
		if(!/^(.|\n)+$/.test(content.value))
		{
			e.preventDefault();
			alert("내용을 작성해주세요.");
			return;
		}
	});  */  
</script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>





