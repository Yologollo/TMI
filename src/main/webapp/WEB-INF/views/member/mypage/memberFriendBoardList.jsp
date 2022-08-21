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
				location.href = '${pageContext.request.contextPath}/board/friend/friendBoardDetail.do?no=' + no;
			}
		});
	});
});
</script>
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
			<button type="button" class="btn btn-outline-secondary btn-lg" onclick="location.href='${pageContext.request.contextPath}/mypage/memberPlannerBoardList.do'">플래너 게시판</button>
			<button type="button" class="btn btn-outline-secondary btn-lg" onclick="location.href='${pageContext.request.contextPath}/mypage/memberReviewBoardList.do'">리뷰 게시판</button>
			<button type="button" class="btn btn-outline-secondary btn-lg" onclick="location.href='${pageContext.request.contextPath}/mypage/memberFriendBoardList.do'">여행 친구 게시판</button>
		</div>
		<h1>여행 친구 게시판</h1>
		<section id="board-container" class="container">
		<table id="tbl-board" class="table table-striped table-hover text-center">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${boardList}" var="friendBoard" varStatus="vs">
				<tr data-no="${friendBoard.fbNo}">
 					<td>${friendBoard.fbNo}</td>
					<td>${friendBoard.fbTitle}</td>
					<td>${friendBoard.MNickName}</td>
					<td>
						<fmt:parseDate value="${friendBoard.fbCreatedAt}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
						<fmt:formatDate value="${createdAt}" pattern="MM-dd HH:mm"/>
					</td>
					<td>${friendBoard.fbReadCount}</td>
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