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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypageboard.css">
<script>
window.addEventListener('load', (e) => {
	document.querySelectorAll("tr[data-no]").forEach((tr) => {
		tr.addEventListener('click', (e) => {
			console.log(e.target);
			const tr = e.target.parentElement;
			console.log(tr);
			if(tr.matches('tr[data-no]')) {
				const no = tr.dataset.no;
				location.href = '${pageContext.request.contextPath}/board/planner/plannerBoardDetail.do?no=' + no;
			}
		});
	});
});
</script>
<div class="intro_top">
	<img src="${pageContext.request.contextPath}/resources/images/planner/plannerBanner.gif"/>
</div>
<div id="commonMain" style="margin-top: 0;">
 	
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
		<div id="boardChangeWrapper">
			<button type="button" class="btn btn-lg" onclick="location.href='${pageContext.request.contextPath}/mypage/memberPlannerBoardList.do'">플래너 게시판</button>
			<button type="button" class="btn btn-lg" onclick="location.href='${pageContext.request.contextPath}/mypage/memberReviewBoardList.do'">리뷰 게시판</button>
			<button type="button" class="btn btn-lg" onclick="location.href='${pageContext.request.contextPath}/mypage/memberFriendBoardList.do'">여행 친구 게시판</button>
		</div>
		<h1>플래너 게시판</h1>
		<section id="board-container" class="container">
		<table id="notice-table" class="kakaobank-table" aria-describedby="kakaobank-notice-summary">
				<colgroup>
					<col width="10%">
					<col width="">
					<col width="20%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" lang="en">No</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">등록일</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
			<c:forEach items="${boardList}" var="plannerBoard" varStatus="vs">
				<tr data-no="${plannerBoard.pbNo}">
 					<td>${plannerBoard.pbNo}</td>
					<td>${plannerBoard.pbTitle}
						<span style="color:red;"><c:if test="${plannerBoard.commentCount > 0}"> [${plannerBoard.commentCount}]</c:if></span>
					</td>
					<td>${plannerBoard.MNickName}</td>
					<td>
						<fmt:parseDate value="${plannerBoard.pbCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
						<fmt:formatDate value="${createdAt}" pattern="MM-dd HH:mm"/>
					</td>
					<td>${plannerBoard.pbReadCount}</td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagebar">
			<nav>${pagebar}</nav>		
		</div>
	</section> 
		
	</div>

</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>