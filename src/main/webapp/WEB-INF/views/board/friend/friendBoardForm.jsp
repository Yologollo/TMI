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
	<input type="text" class="form-control" placeholder="제목" name="title" id="title" required>
	<input type="text" class="form-control" name="memberId" value="작성자 : " readonly required>
	
	<div class="input-group mb-3">
	  <label class="input-group-text" for="inputGroupFile01">Upload</label>
	  <input type="file" class="form-control" id="inputGroupFile01">
	</div>
	<textarea class="form-control" id="content" name="content" placeholder="내용" rows="25" cols="50" required></textarea>
	<br /><br />
	<input type="submit" id="save" class="btn btn-primary btn-lg" value="저장" onclick="">
	<input type="submit" class="btn btn-primary btn-lg" value="취소" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoard.do'">
	<br /><br /><br />

</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>





