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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/planner.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myplanner.css?after">

<form action="${pageContext.request.contextPath}/planner/createPlanner.do" name="createPlannerFrm" method="POST">
	<div class="createPlannerModalForm">
		<div class="modal-dialog-centered" id="createPlannerModal">
			<div class="modal-content">
				<div class="modal-header">
					<h1>플래너 작성</h1>
					<button type="button" class="btn-close" id="btnModalCloseUp" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modalInfo" id="travelTitleWrapper">
						<label for="travelTitle">여행 제목</label>
						<input type="hidden" class="form-control" name="pmEmail" value="<sec:authentication property="principal.mEmail"/>" readonly required>
						<input type="text" class="form-control" id="travelTitle" name="pTitle" placeholder="여행 제목">
					</div>
					<div class="modalInfo" id="travelTimeWrapper">
						<div id="travelTimeStartWrapper">
							<label for="travelTime">여행 기간</label>
							<input type="date" class="travelTimeClass form-control" name="pLeaveDate" id="travelTimeStart" placeholder="출발">					
						</div>
						<div id="travelTimeEndWrapper">				
							<span> ~</span>
							<input type="date" class="travelTimeClass form-control" name="pReturnDate" id="travelTimeEnd" placeholder="도착">
						</div>
					</div>
					<div class="modalInfo" id="travelMemoWrapper">
						<label for="travelMemo">설명</label>
						<input type="text" class="form-control"id="travelMemo" name="pExplan" placeholder="설명">
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-lg" id="btnModalCreateModal">플래너 작성</button>
					<button type="button" class="btn btn-lg" id="btnModalCloseDown" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</form>

<div class="intro_top">
	<img src="${pageContext.request.contextPath}/resources/images/planner/plannerBanner.gif"/>
</div>
<div id="commonMain" style="margin-top: 0;">
	<div id="wrapper">
		<div id="plannerContainer">
			<div id="plannerInfo">
				<button type="button" id="createPlannerModalbtn" class="btn btn-lg">플래너 작성</button>
			</div>
			
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
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<script>
document.querySelector('.createPlannerModalForm').addEventListener('click', function(e) {
	if (e.target == document.querySelector('.createPlannerModalForm')) {
		document.querySelector('.createPlannerModalForm').classList.remove('show-modal');
	}
});

$('#createPlannerModalbtn').on('click', function() {
	$('.createPlannerModalForm').addClass('show-modal');
});

$('#btnModalCloseUp').on('click', function() {
    $('.createPlannerModalForm').removeClass('show-modal');
});

$('#btnModalCloseDown').on('click', function() {
    $('.createPlannerModalForm').removeClass('show-modal');
});

document.createPlannerFrm.addEventListener('submit', (e) => {
	var pTitle = document.createPlannerFrm.pTitle.value
    var pLeaveDate = new Date(document.createPlannerFrm.pLeaveDate.value);
    var pReturnDate = new Date(document.createPlannerFrm.pReturnDate.value);

    if(!pTitle) {
    	e.preventDefault();
    	alert("여행 제목을 입력해주세요.");
    	return;
    }
    
    if(pReturnDate < pLeaveDate){
    	e.preventDefault();
    	alert("도착 날짜가 출발 날짜보다 빠릅니다.");
    	return;
    }
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>