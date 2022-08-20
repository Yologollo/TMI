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
<style>
#tbl-board {
	float:right; 
	width: 85%; 
	border: 1px solid black;
	height: 300px;
}
tr[data-no] {
	cursor: pointer;
}
</style>
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
					<a href="${pageContext.request.contextPath}/mypage/memberBoardList.do">My 게시글</a>
				</li>
				<hr />
				<li class="mypageMenuli">
					<a href="${pageContext.request.contextPath}/mypage/memberDelete.do">회원탈퇴</a>
				</li>
				<hr />
			</ul>
		</div>
		<div style="height:100px; border:1px solid black; float:right; width: 80%;">
		${boardList.fbNo}
		</div>
		<section id="board-container" class="container">
		<table id="tbl-board" class="table table-striped table-hover text-center">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>첨부파일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${boardList}" var="friendBoard" varStatus="vs">
				<tr data-no="${friendBoard.fbNo}">
					<td>${friendBoard.fbNo}</td>
					<td>${friendBoard.fbTitle}<c:if test="${friendBoard.commentCount > 0}"> (${friendBoard.commentCount})</c:if></td>
					<td>${friendBoard.mNicknName}</td>
					<td>
						<fmt:parseDate value="${friendBoard.fb_created_at}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
						<fmt:formatDate value="${createdAt}" pattern="MM-dd HH:mm"/>
					</td>
					<td>
						<c:if test="${friendBoard.attachCount gt 0}">
							<img src="${pageContext.request.contextPath}/resources/images/board/file.png" width="16px" />
						</c:if>
					</td>
					<td>${friendBoard.fb_read_count}</td>
				</tr>
			</c:forEach>
		</table>
		<div style="width:300px; height: 300px; float: right; text-align: center; border: 1px solid black;">
			<nav>${pagebar}</nav>		
		</div>
	</section> 
		
	</div>

</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>