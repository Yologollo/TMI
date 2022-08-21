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
	작업 : 김용민
 -->
 	<!-- 메뉴버튼 시작 -->
	<ul class="menuBtn" id="menuBtn">
      <li><a href="${pageContext.request.contextPath}/board/planner/plannerBoard.do" data-hover="플래너 게시판">플래너 게시판</a></li>
      <li class="current"><a href="${pageContext.request.contextPath}/board/bestplanner/bestPlanner.do" data-hover="베스트 플래너">베스트 플래너</a></li>
      <li><a href="${pageContext.request.contextPath}/board/review/reviewBoard.do" data-hover="후기 게시판">후기 게시판</a></li>
      <li><a href="${pageContext.request.contextPath}/board/bestreview/bestReview.do" data-hover="베스트 후기 게시판">베스트 후기 게시판</a></li>
      <li><a href="${pageContext.request.contextPath}/board/friend/friendBoard.do" data-hover="여행친구 게시판">여행친구 게시판</a></li>
    </ul>
    <!-- 메뉴버튼 끝 -->
 	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 </div>
 <script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>