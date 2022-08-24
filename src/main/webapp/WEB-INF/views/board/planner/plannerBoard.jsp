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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myplanner.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/thumbnailboard.css">
<style>	
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

<div id="boardMain" style="text-align : center;">
<!-- 
	생성 : 김용민, 이경석
	작업 : 김용민, 이경석
 -->
  <br /><br />
 <hr />
 	 <!-- 메뉴버튼 시작 -->
	<ul class="menuBtn" id="menuBtn">
      <li class="current"><a href="${pageContext.request.contextPath}/board/planner/plannerBoard.do" data-hover="플래너 게시판">플래너 게시판</a></li>
      <li><a href="${pageContext.request.contextPath}/board/bestplanner/bestPlanner.do" data-hover="베스트 플래너">베스트 플래너</a></li>
      <li><a href="${pageContext.request.contextPath}/board/review/reviewBoard.do" data-hover="후기 게시판">후기 게시판</a></li>
      <li><a href="${pageContext.request.contextPath}/board/bestreview/bestReview.do" data-hover="베스트 후기 게시판">베스트 후기 게시판</a></li>
      <li><a href="${pageContext.request.contextPath}/board/friend/friendBoard.do" data-hover="여행친구 게시판">여행친구 게시판</a></li>
    </ul>
    <!-- 메뉴버튼 끝 -->
    <hr />
 	<br /><br />
 	<h1>플래너 게시판</h1>
 	<br />
 	<div id="infoMain">
			<div id="innerDiv">
		 		<c:if test="${empty loginMember}">
					<p class="btn-lg">로그인 하셔야 작성 가능합니다.</p>
				</c:if>
				<c:if test="${not empty loginMember}">
					<button class="btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/planner/plannerBoardForm.do'">글쓰기</button>
				</c:if>
			</div>

				<div id="wrapper">
				<div id="plannerContainer" >
				<c:forEach items="${list}" var="plannerBoard" varStatus="vs">
					<div class="card" style="width: 18rem; display:inline-block; box-shadow: 1px 1px 3px 1px #dadce0; margin-right : 10px; margin-bottom : 10px;" data-no="${plannerBoard.PNo}" >
						<div class="dayAllMapClass" id="dayAllMap${vs.count}"></div>
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3b1f2155fb7376c8e3ce304aebd498b"></script>
							<script>
								var mapContainer = document.getElementById('dayAllMap${vs.count}');
								
								var mapOption = {
							    		center: new kakao.maps.LatLng(36.25, 127.75),
								        level: 14
								};
								
								var map = new kakao.maps.Map(mapContainer, mapOption);
								
								var polyline = new kakao.maps.Polyline({
				                       map: map,
				                       path: [],
				                       strokeWeight: 3,
				                       strokeColor: '#5882fa',
				                       strokeOpacity: 1,
				                       strokeStyle: 'solid'
				                   });
								
								<c:forEach items="${plans}" var="plan" varStatus="status">
									<c:if test="${plannerBoard.PNo eq plan.pppNo}">
										var markerPosition  = new kakao.maps.LatLng(${plan.ppY}, ${plan.ppX});
		                                var marker = new kakao.maps.Marker({
		                                    position: markerPosition
		                                });
		                                marker.setMap(map);
		                                
		                                var point =  new kakao.maps.LatLng(${plan.ppY}, ${plan.ppX});
		                                var path = polyline.getPath();
		                                path.push(point);
		                                polyline.setPath(path);
									</c:if>
								</c:forEach>
							</script>
		                <a href="${pageContext.request.contextPath}/board/planner/plannerBoardDetail.do?no=${plannerBoard.pb_no}">
							<div class="card-body">
								<span class="cardDateSpan">${plannerBoard.PLeaveDate} ~ ${plannerBoard.PReturnDate}</span>
								<span class="cardDaySpan">
									<fmt:parseDate value="${plannerBoard.PLeaveDate}" var="leaveDateFormat" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${leaveDateFormat}" pattern="dd" var="leaveDate" />
									<fmt:parseDate value="${plannerBoard.PReturnDate}" var="returnDateFormat" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${returnDateFormat}" pattern="dd" var="returnDate" />
									${returnDate - leaveDate} DAY
								</span><br />
								<span class="cardTitleSpan">${plannerBoard.pb_title}</span><br />
							</div>
						</a>
					</div>
				</c:forEach>
				</div>
				</div>
		<br /><br />
 		<nav>${pagebar}</nav>
 </div>
 </div>
 <script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>