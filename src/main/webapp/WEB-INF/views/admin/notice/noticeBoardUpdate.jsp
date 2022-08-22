<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="utf-8" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="공지사항 수정" name="title" />
</jsp:include>
<!-- include libraries(jQuery, bootstrap) -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style>
	#content {
		resize : none;
		
	}
	#save {
		margin-left :45%;
	}
</style>
<div id="commonMain">
 	<form:form name="boardFrm" action="${pageContext.request.contextPath}/admin/notice/noticeBoardUpdate.do" method="POST" enctype="multipart/form-data">
		<input type="hidden" class="form-control" name="nbNo" id="no" value="${insertNoticeBoard.nbNo}" required>
		<input type="text" class="form-control"  name="nbTitle" id="title" value="${insertNoticeBoard.nbTitle}" required > 
		<input type="text" class="form-control" name="nbMEmail" value="<sec:authentication property="principal.mEmail"/>" readonly required>
		
		<c:if test="${not empty insertNoticeBoard.attachments}">
			<c:forEach items="${insertNoticeBoard.attachments}" var="attach" varStatus="vs">
				<div class="btn-group-toggle pb-1" data-toggle="buttons">
	            	<label class="btn btn-outline-danger btn-block" title="${attach.nbaOriginalFilename} 삭제">
	                	<input type="checkbox" id="delFile${vs.count}" name="delFile" value="${attach.nbaNo}">
						<c:if test="${fn:length(attach.nbaOriginalFilename) ge 30}">
							${fn:substring(attach.nbaOriginalFilename, 0, 30)}... 삭제
						</c:if> 
						<c:if test="${fn:length(attach.nbaOriginalFilename) lt 30}">
							${attach.nbaOriginalFilename} 삭제
						</c:if>
	            	</label>
	        	</div>
			</c:forEach>
		</c:if>
		
		<div class="input-group mb-3">
		  <label class="input-group-text" for="inputGroupFile01">Upload</label>
		  <input type="file" name="upFile" class="form-control" id="inputGroupFile01" multiple>
		  
		</div>
		
		<textarea id="summernote" name="nbContent">${insertNoticeBoard.nbContent}</textarea>
	  	  	
	  	
	  	
		<br /><br />
		<input type="hidden" name="nbNo" value="${insertNoticeBoard.nbNo}" />
		<input type="submit" id="save" class="btn btn-primary btn-lg" value="저장" >
		<input type="submit" class="btn btn-primary btn-lg" value="취소" onclick="location.href='${pageContext.request.contextPath}/admin/notice/noitceBoard.do'">
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
	

	</script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>





