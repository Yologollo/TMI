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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/planner.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myplanner.css?after">
<div id="commonMain">
<!-- 
	생성 : 김용민
	작업 : 김용민
 -->
	<div id="bannder">배너 / 공유 플래너</div>
	<div id="wrapper">
		<div id="menuContainer">
			<ul>
				<li class="plannerMenuli">
					<a href="${pageContext.request.contextPath}/planner/myplanner">My 플래너</a>
				</li>
				<hr />
				<li class="plannerMenuli">
					<a href="${pageContext.request.contextPath}/planner/sharePlanner">공유 플래너</a>
				</li>
				<hr />
				<li class="plannerMenuli">
					<a href="${pageContext.request.contextPath}/planner/lovePlanner">좋아요 플래너</a>
				</li>
				<hr />
			</ul>
		</div>
		<div id="plannerContainer">
			<div id="cardWrapper">
			<c:if test="${empty plannerList}">
		    	<span>작성된 플래너가 없습니다.</span>
	    	</c:if>
	    	
	    	<c:if test="${not empty plannerList}">
				<c:forEach items="${plannerList}" var="planner" varStatus="vs">
					<div class="card" style="width: 18rem;" data-no="${planner.PNo}">
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
									<c:if test="${planner.PNo eq plan.pppNo}">
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
		                <a href="${pageContext.request.contextPath}/planner/detailPlanner.do?pNo=${planner.PNo}">
							<div class="card-body">
								<span class="cardDateSpan">${planner.PLeaveDate} ~ ${planner.PReturnDate}</span>
								<span class="cardDaySpan">
									<fmt:parseDate value="${planner.PLeaveDate}" var="leaveDateFormat" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${leaveDateFormat}" pattern="dd" var="leaveDate" />
									<fmt:parseDate value="${planner.PReturnDate}" var="returnDateFormat" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${returnDateFormat}" pattern="dd" var="returnDate" />
									${returnDate - leaveDate} DAY
								</span><br />
								<span class="cardTitleSpan">${planner.PTitle}</span><br />
								<span class="cardExplanSpan">${planner.PExplan}</span>
							</div>
						</a>
					</div>
	            </c:forEach>
            </c:if>
		</div>
		</div>
	</div>
	
</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>