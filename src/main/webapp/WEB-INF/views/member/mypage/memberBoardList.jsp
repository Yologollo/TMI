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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<div id="commonMain">
<!-- 
	생성 : 김용민
	작업 : 김용민
 -->

 	<div id="bannder">배너 / My게시글</div>
 	
 	<div id="wrapper">
 	
	 	<div id="menuContainer">
			<ul>
				<li class="mypageMenuli">
					<a href="${pageContext.request.contextPath}/mypage/memberDetail.do">My 페이지</a>
				</li>
				<hr />
				<li class="mypageMenuli">
					<a href="${pageContext.request.contextPath}/mypage/memberBoardList.do">My 게시글</a>
				</li>
				<hr />
				<li class="mypageMenuli">
					<a href="${pageContext.request.contextPath}/mypage/memberDelete.do">회원탈퇴</a>
				</li>
				<hr />
			</ul>
		</div>
		
	</div>

</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>