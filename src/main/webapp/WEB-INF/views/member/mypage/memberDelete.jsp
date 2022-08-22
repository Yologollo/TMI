<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="utf-8" />
<!-- 
	생성 : 김용민
	작업 : 김용민
 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Travel Making Imagine" name="title" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberdelete.css">
<div id="commonMain">
 	<div id="bannder">배너 / 회원탈퇴</div>
 	
 	<div id="wrapper">
 	
	 	<div id="menuContainer">
			<ul>
				<li class="mypageMenuli">
					<a href="${pageContext.request.contextPath}/mypage/memberDetail.do">My 페이지</a>
				</li>
				<hr />
				<li class="mypageMenuli">
					<a href="${pageContext.request.contextPath}/mypage/memberPlannerBoardList.do">My 게시글</a>
				</li>
				<hr />
				<li class="mypageMenuli">
					<a href="${pageContext.request.contextPath}/mypage/memberDelete.do">회원탈퇴</a>
				</li>
				<hr />
			</ul>
		</div>
		
		<div id="memberDeleteWrapper">
			<div id="memberDeleteInfoWrapper">
				회원탈퇴시 이미 작성하신 게시판 또는 플래너는 같이 파기되며,
				<br />
				탈퇴 후 개인 정보 또한 파기됩니다.
				<br />
				탈퇴 시, 파기된 정보는 복구 불가능 합니다.
			</div>
			<div id="memberDeleteBtnWrapper">
				<form name="memberDeleteFrm" action="${pageContext.request.contextPath}/mypage/memberDelete.do" method="POST">
					<button type="submit" value="${mNo}" class="btn btn-danger btn-lg" id="memberDeleteBtn">회원 탈퇴</button>			
				</form>
			</div>
		
		</div>
	</div>


</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>