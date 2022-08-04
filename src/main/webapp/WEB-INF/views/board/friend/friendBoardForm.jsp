<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="utf-8" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="글 작성" name="title" />
</jsp:include>
<!-- include libraries(jQuery, bootstrap) -->
<!-- include summernote css/js -->
<!--     <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script> -->

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
<!-- 
	생성 : 이경석
	작업 : 이경석
 -->
	
	<form method="post">
		<input type="text" class="form-control" placeholder="제목을 입력해주세요." name="title" id="title" required>
		<input type="text" class="form-control" name="memberId" value="작성자 : " readonly required>
		
		<div class="input-group mb-3">
		  <label class="input-group-text" for="inputGroupFile01">Upload</label>
		  <input type="file" class="form-control" id="inputGroupFile01">
		</div>
		
	  	<div id="summernote"></div>
	</form>

	<br /><br />
	<input type="submit" id="save" class="btn btn-primary btn-lg" value="저장" onclick="">
	<input type="submit" class="btn btn-primary btn-lg" value="취소" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoard.do'">
	<br /><br /><br />

</div>
<script>
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





