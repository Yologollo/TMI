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
<div id="commonMain">
<!-- 
	생성 : 김용민
	작업 : 김용민, 이경석
 -->
 	<input type="button" value="플래너 게시판" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/planner/plannerBoard.do'"/>
 	<input type="button" value="베스트 플레너" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/bestplanner/bestPlanner.do'"/>
 	<input type="button" value="후기 게시판" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/review/reviewBoard.do'"/>
 	<input type="button" value="베스트 후기 게시판" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/bestreview/bestReview.do'"/>
 	<input type="button" value="여행친구 게시판" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoard.do'"/>
 	
 	<h1>여행 친구 게시판</h1>
	<section id="board-container" class="container">
		<input type="button" value="글쓰기" id="btn-add" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoardForm.do'"/>
		<table id="tbl-board" class="table table-striped table-hover text-center">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>첨부파일</th>
				<th>조회수</th>
			</tr>
		</table>
	</section> 
 	
 	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 </div>
 <script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>