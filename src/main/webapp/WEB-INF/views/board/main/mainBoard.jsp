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
	#bestPlanner {
		width:100%;
		height : 500px;
		border: 1px solid green; 
		margin: auto; 
		overflow: hidden;
	}
	
	#bestReview {
		width:100%;
		height : 500px;
		border: 1px solid blue; 
		margin: auto; 
		overflow: hidden;
	}
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
<div id="commonMain">
<!-- 
	생성 : 김용민
	작업 : 김용민
 -->
 	<h1>메인 게시판</h1>
 	
 	<input type="button" value="플래너 게시판" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/planner/plannerBoard.do'"/>
 	<input type="button" value="베스트 플레너" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/bestplanner/bestPlanner.do'"/>
 	<input type="button" value="후기 게시판" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/review/reviewBoard.do'"/>
 	<input type="button" value="베스트 후기 게시판" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/bestreview/bestReview.do'"/>
 	<input type="button" value="여행친구 게시판" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoard.do'"/>
 	
 	<div id="bestPlanner">
 	
 	</div>
 	
 	<div id="bestReview">
 	<h1>베스트 오브 베스트</h1>
		<section id="board-container" class="container">
				<article>
					<c:forEach items="${list3}" var="reviewBoard" varStatus="vs">
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
	 		<%-- <nav>${pagebar}</nav> --%>
		</section> 
 	</div>
 </div>
 <script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>