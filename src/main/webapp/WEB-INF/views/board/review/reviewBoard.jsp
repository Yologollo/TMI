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
	tr[data-no] {
		cursor: pointer;
	}
	.reviewBoard {
		width : 200px;
		height : 250px;
		border: 1px solid red; 
		margin: auto; 
		margin-top:4.5rem;
		overflow: hidden;
		position: relative;
	}
	.imageReviewBoard {
		width : 200px;
		height : 180px;
		border: 1px solid blue; 
		margin: auto; 
		overflow: hidden;
		position: relative;
	}
	
	.thumbNailLink {
		display: inline-block;
		margin : 10px;
		width : 300px;
		height : 200px;
		text-align: center;
	}
	
	.thumbNailName {
		display : inline-block;
		width : 300px;
		height : 65px;
		text-align: center;
	}
	#contentArea2 {
		width : 280px;
		height : 330px;
		border: 1px solid red; 
		margin: auto; 
		overflow: hidden;
		display: inline-block;
	}
	
</style>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember" scope="page"/>
	<script>
		const mEmail = '${loginMember.MEmail}';
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${pageContext.request.contextPath}/resources/js/ws.js"></script>
</sec:authorize>

<script>
window.addEventListener('load', (e) => {
	document.querySelectorAll("tr[data-no]").forEach((tr) => {
		tr.addEventListener('click', (e) => {
			console.log(e.target);
			const tr = e.target.parentElement;
			console.log(tr);
			if(tr.matches('tr[data-no]')) {
				const no = tr.dataset.no;
				location.href = '${pageContext.request.contextPath}/board/review/reviewBoardDetail.do?no=' + no;
			}
		});
	});
});
</script>
<div id="commonMain">
<!-- 
	생성 : 김용민
	작업 : 김용민, 이경석
 -->

 	<!-- 메뉴버튼 시작 -->
	<ul class="menuBtn" id="menuBtn">
      <li><a href="${pageContext.request.contextPath}/board/planner/plannerBoard.do" data-hover="플래너 게시판">플래너 게시판</a></li>
      <li><a href="${pageContext.request.contextPath}/board/bestplanner/bestPlanner.do" data-hover="베스트 플래너">베스트 플래너</a></li>
      <li class="current"><a href="${pageContext.request.contextPath}/board/review/reviewBoard.do" data-hover="후기 게시판">후기 게시판</a></li>
      <li><a href="${pageContext.request.contextPath}/board/bestreview/bestReview.do" data-hover="베스트 후기 게시판">베스트 후기 게시판</a></li>
      <li><a href="${pageContext.request.contextPath}/board/friend/friendBoard.do" data-hover="여행친구 게시판">여행친구 게시판</a></li>
    </ul>
    <!-- 메뉴버튼 끝 -->
	<section id="board-container" class="container">
 		<input type="button" value="글쓰기" id="btn-add" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/review/reviewBoardForm.do'"/>
			<article>
				<c:forEach items="${list}" var="reviewBoard" varStatus="vs">
						<div id="contentArea2">
							<div id="selectContent">
								<a href="${pageContext.request.contextPath}/board/review/reviewBoardDetail.do?no=${reviewBoard.rb_no}">
									<span class="thumbNailImage">
										<img src="${reviewBoard.rb_content}" onerror="this.src='${pageContext.request.contextPath}/resources/images/noImage.png'"/>
									</span>
									<strong class="thumbNailName">
										${reviewBoard.rb_title}
									</strong>
								</a>
							</div>
						</div>
				</c:forEach>
			</article>
 		<nav>${pagebar}</nav>
 		
 		<form action="${pageContext.request.contextPath}/board/review/reviewBoardSearch.do" method="get">
		<div class="search">
    		<select name="searchType">
      			<option value="n"<c:out value="${reviewBoardSearch.searchType == null ? 'selected' : ''}"/>>-----</option>
      			<option value="t"<c:out value="${reviewBoardSearch.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      			<option value="c"<c:out value="${reviewBoardSearch.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      			<option value="w"<c:out value="${reviewBoardSearch.searchType eq 'e' ? 'selected' : ''}"/>>작성자</option>
      			<option value="tc"<c:out value="${reviewBoardSearch.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    		</select>
    		<input type="text" name="keyword" id="keywordInput" value="${reviewBoardSearch.keyword}"/>
    	
    		<button id="searchBtn" type="submit">검색</button>
  		</div> 
  		</form>
  		
	</section> 
 </div>
 <script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>