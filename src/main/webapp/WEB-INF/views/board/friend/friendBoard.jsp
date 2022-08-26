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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/thumbnailboard.css">
<style>
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
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember" scope="page"/>
	<script>
		const mEmail = '${loginMember.MEmail}';
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${pageContext.request.contextPath}/resources/js/ws.js"></script>
</sec:authorize>

<div id="boardMain" style="text-align : center;">
<!-- 
	생성 : 김용민, 이경석
	작업 : 김용민, 이경석
 -->
 <br /><br />
 <hr />
 	<!-- 메뉴버튼 시작 -->
	<ul class="menuBtn" id="menuBtn">
      <li><a href="${pageContext.request.contextPath}/board/planner/plannerBoard.do" data-hover="플래너 게시판">플래너 게시판</a></li>
      <li><a href="${pageContext.request.contextPath}/board/bestplanner/bestPlanner.do" data-hover="베스트 플래너">베스트 플래너</a></li>
      <li><a href="${pageContext.request.contextPath}/board/review/reviewBoard.do" data-hover="후기 게시판">후기 게시판</a></li>
      <li><a href="${pageContext.request.contextPath}/board/bestreview/bestReview.do" data-hover="베스트 후기 게시판">베스트 후기 게시판</a></li>
      <li class="current"><a href="${pageContext.request.contextPath}/board/friend/friendBoard.do" data-hover="여행친구 게시판">여행친구 게시판</a></li>
    </ul>
    <!-- 메뉴버튼 끝 -->
    <hr />
	<section id="board-container" class="container">
		<table id="notice-table" class="kakaobank-table" aria-describedby="kakaobank-notice-summary">
		<div id="innerDiv" style="margin-right : 0;">
			<c:if test="${empty loginMember}">
				<span class="btn-lg">로그인 하셔야 작성 가능합니다.</span>
			</c:if>
			<c:if test="${not empty loginMember}">
				<button class="btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoardForm.do'">글쓰기</button>
			</c:if>
		</div>
			<colgroup>
		          <col width="10%">
		          <col width="">
		          <col width="20%">
		          <col width="20%">
		          <col width="10%">
		          <col width="10%">
		    </colgroup>
			<thead>
				<tr>
				<th scope="col" lang="en">No</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">첨부파일</th>
				<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="friendBoard" varStatus="vs">
					<tr data-no="${friendBoard.fb_no}">
						<td>${friendBoard.fb_no}</td>
						<td style="color:#000;">
							${friendBoard.fb_title}
							<span style="color:red;"><c:if test="${friendBoard.commentCount > 0}"> [${friendBoard.commentCount}]</c:if></span>
						</td>
						<td>${friendBoard.m_nickname}</td>
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
			</tbody>
		</table>
		<nav>${pagebar}</nav>
		
		<form action="${pageContext.request.contextPath}/board/friend/friendBoardSearch.do" method="get">
		<div class="search">
    		<select name="searchType" id="searchType">
      			<option value="n"<c:out value="${friendBoardSearch.searchType == null ? 'selected' : ''}"/>>-----</option>
      			<option value="t"<c:out value="${friendBoardSearch.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      			<option value="c"<c:out value="${friendBoardSearch.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      			<option value="w"<c:out value="${friendBoardSearch.searchType eq 'e' ? 'selected' : ''}"/>>작성자</option>
      			<option value="tc"<c:out value="${friendBoardSearch.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    		</select>
    		<div id="keywordInput_wrap">
    		<input type="text" name="keyword" id="keywordInput" placeholder="검색" value="${friendBoardSearch.keyword}"/>
    		</div>
    		<button type="submit" id="searchBtn"><img src="${pageContext.request.contextPath}/resources/images/search1.png"/></button>
  		</div> 
  		</form>

		</section> 
 	
 	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
 </div>
 <script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>