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
	<jsp:param value="공지사항등록" name="title" />
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<style>
	#content {
		resize : none;
	}
	
	#save {
		margin-left :45%;
	}
	
	.btn-lg {
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

<div id="commonMain" >
	 <h1>공지사항 작성</h1>
 	<form:form name="boardFrm" action="${pageContext.request.contextPath}/admin/notice/noticeBoardEnroll.do" method="POST" enctype="multipart/form-data">
		<input type="text" class="form-control"  name="nbTitle" id="title" placeholder="제목을 입력해주세요." required>
		<input type="text" class="form-control" name="nbMEmail" value="<sec:authentication property="principal.mEmail"/>" readonly required>
		
		<div class="input-group mb-3" >
		  <label class="input-group-text" for="inputGroupFile01">Upload</label>
		  <input type="file" name="upFile" class="form-control" id="inputGroupFile01" multiple>
		</div>
		
	  	<textarea id="summernote" name="nbContent"></textarea>
	  	
		<br /><br />
		<input type="submit" id="save" class="btn btn-primary btn-lg" value="저장" >
		<input type="submit" class="btn btn-primary btn-lg" value="취소" onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeBoard.do'">
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





