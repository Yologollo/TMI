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

<script>
// 페이지가 열릴때 페이지 새로고침
window.onload = function() {
	setTimeout(function(){
		(function() {
			if( window.localStorage ) {
		  	if( !localStorage.getItem('firstLoad') ) {
			    localStorage['firstLoad'] = true;
			    window.location.reload();
		  	} else 
		    	localStorage.removeItem('firstLoad');
			}
		})();
	}, 500);
}

// DAY 1 지도 도출
$(document).ready(function () {
	
	var dayAllMapClass = document.querySelectorAll(".dayAllMapClass");
    var dayAllMapInfo = document.querySelectorAll(".dayAllMapInfo");
    var index = 0;

    function show(n){
    	
        for(var i = 0; i < dayAllMapClass.length; i++){
        	dayAllMapClass[i].style.display = "none";
        }
        
        dayAllMapClass[n].style.display = "block";

        for(var j = 0; j < dayAllMapInfo.length; j++){
        	dayAllMapInfo[j].style.display = "none";
        }
        
        dayAllMapInfo[n].style.display = "block";
    }
    
    show(index);
    
});
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detailplanner.css?after">
<div id="commonMain">
<!-- 
	생성 : 김용민
	작업 : 김용민, 이경석
 -->
	<div id="bannder">배너 / 플래너 디테일</div>
	<div id="wrapper">
		<div id="menuContainer">
			<ul>
				<li class="plannerMenuli">
					<a href="${pageContext.request.contextPath}/planner/myplanner">My 플래너</a>
				</li>
				<hr />
			</ul>
		</div>

		
		<div id="plannerContainer">
				<div id="plannerInfo" data-no="${planner.PNo}">
					<button type="button" id="btnDeletePlanner" class="btn btn-danger btn-lg" data-no="${planner.PNo}">삭제</button>			
					<button type="button" id="btnUpdatePlanner" class="btn btn-primary btn-lg" 
						onclick="location.href='${pageContext.request.contextPath}/planner/createplan.do?pNo=${planner.PNo}'">수정</button>
				</div>
			
			<form action="${pageContext.request.contextPath}/planner/deletePlanner.do" name="plannerDelFrm" method="POST">
				<input type="hidden" name="pNo" />
			</form>
			
			<div id="plannerContainerWrapper">
				<div id="plannerDetailWrapper">
					<div id="plannerTitle">${planner.PTitle}</div>
					<div id="plannerDetailCardWrapper">
					<div class="plannerDetailCard card">
						<c:forEach items="${days}" var="day" varStatus="status">
							<div class="card-header">
								<span class="plannerDetailCardDay">DAY ${status.count}</span>
								<span class="plannerDetailCardTime">
									<fmt:parseDate value="${day}" var="dayformat" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${dayformat}" pattern="yyyy.MM.dd E요일" />
								</span>
							</div>
						
							<% int i = 1;%>
							<c:forEach items="${plans}" var="plan" varStatus="plan_status">
								<fmt:parseDate value="${day}" var="dayformat" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${dayformat}" pattern="yyyy-MM-dd" var="nowDate" />
	                            <fmt:parseDate value="${plan.ppDate}" var="ppDateformat" pattern="yyyy-MM-dd"/>
								<fmt:formatDate value="${ppDateformat}" pattern="yyyy-MM-dd" var="openDate" />

                            	<c:if test="${nowDate eq openDate}">
                            
								<div class="plannerDetailCardBody card-body" data-no="${plan.ppNo}">
									<div class="plannerDetailCardBodyInfo">
										<blockquote class="blockquote mb-0">
											<div class="plannerDetailCardBodyTimeWrapper">
												<span class="plannerDetailCardBodyTime"><fmt:formatDate value="${plan.ppTime}" pattern="a hh:mm"/></span>
											</div>
											<div class="plannerDetailCardBodyPlaceWrapper">
												<span class="plannerDetailCardBodyPlaceNumber"><%=i%>. </span>
												<span class="plannerDetailCardBodyPlace">${plan.ppPlaceName}</span>
											</div>
											<footer class="blockquote-footer">
												<span class="plannerDetailCardBodyMemo">${plan.ppMemo}</span>
											</footer>
										</blockquote>
									</div>
									<div class="plannerDetailCardBodyMap" id="map${status.count}-${plan_status.count}"></div>
									<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3b1f2155fb7376c8e3ce304aebd498b"></script>
									<script>
									    /* 지도 생성 */
									    var mapContainer = document.getElementById('map${status.count}-${plan_status.count}');
									    var mapOption = {
								    		center: new kakao.maps.LatLng(${plan.ppY}, ${plan.ppX}),
									        level: 3
									    };
									    var map = new kakao.maps.Map(mapContainer, mapOption);
									
									    /* 마커 생성 */
									    var markerPosition  = new kakao.maps.LatLng(${plan.ppY}, ${plan.ppX});
									    var marker = new kakao.maps.Marker({
									        position: markerPosition
									    });
									    marker.setMap(map);
									</script>
								</div>
							 <% ++i;%>
							 	</c:if>
							</c:forEach>
						</c:forEach>
					</div>
					</div>
				</div>
				
				<div id="plannerAllWrapper">
					<div class="allMap">
					
						<c:forEach items="${days}" var="day" varStatus="status">
						
							<div class="dayAllMapClass" id="dayAllMap${status.count}"></div>
							
							<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3b1f2155fb7376c8e3ce304aebd498b"></script>
							<script>
								var mapContainer = document.getElementById('dayAllMap${status.count}');
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
								 
								 var a = 0;
							    
							    
								 <c:forEach items="${plans}" var="plan" varStatus="plan_status">
								 	 <fmt:parseDate value="${day}" var="dayformat" pattern="yyyy-MM-dd"/>
									 <fmt:formatDate value="${dayformat}" pattern="yyyy-MM-dd" var="nowDate" />
									 <fmt:formatDate value="${plan.ppDate}" pattern="yyyy-MM-dd" var="openDate" />
									 <fmt:parseDate value="${plan.ppDate}" var="ppDateformat" pattern="yyyy-MM-dd"/>
									 <fmt:formatDate value="${ppDateformat}" pattern="yyyy-MM-dd" var="openDate" />
	
		
									 <c:if test="${nowDate eq openDate}">
									 	var markerPosition  = new kakao.maps.LatLng(${plan.ppY}, ${plan.ppX});
									 	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png',
									 	imageSize = new kakao.maps.Size(36, 37),
									 	
									 	imgOptions =  {
		                                    spriteSize : new kakao.maps.Size(36, 691),
		                                    spriteOrigin : new kakao.maps.Point(0, (a*46)+10),
		                                    offset: new kakao.maps.Point(13, 37) 
	                                	},
	                                	
		                                markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		                                marker = new kakao.maps.Marker({
		                                    position: markerPosition,
		                                    image: markerImage
	                                	});
									 	
	                           			marker.setMap(map);
	
	
			                            var point =  new kakao.maps.LatLng(${plan.ppY}, ${plan.ppX});
			                            var path = polyline.getPath();
			                            path.push(point);
			                            polyline.setPath(path);
	
	                       				++a;
	                        		</c:if>
	                			</c:forEach>		    
							</script>
						</c:forEach>
						
						<div class="dayAllMapSelectWrapper">
                            <select id="dayAllMapSelectId" class="dayAllMapSelectClass" onchange="mapChange()">
                                <c:forEach items="${days}" var="day" varStatus="status">
                                    <option value="${status.index}">DAY ${status.count}</option>
                                </c:forEach>
                            </select>
                        </div>
						
						<div class="card">
	                        <c:forEach items="${days}" var="day" varStatus="status">
	                            <div class="card-body dayAllMapInfo">
	
	                                <% int j = 1;%>
	
	                                     <c:forEach items="${plans}" var="plan" varStatus="plan_status">
	                                        <!-- 화면에서 보이면 주석처리 -->
	                                        <fmt:parseDate value="${day}" var="dayformat" pattern="yyyy-MM-dd"/>
	                                        <fmt:formatDate value="${dayformat}" pattern="yyyy-MM-dd" var="nowDate" />
	                                        <fmt:parseDate value="${plan.ppDate}" var="ppDateformat" pattern="yyyy-MM-dd"/>
	                            			<fmt:formatDate value="${ppDateformat}" pattern="yyyy-MM-dd" var="openDate" />
	
	                                        <c:if test="${nowDate eq openDate}">
	                                            <div class="dayAllMapInfoNo" data-no="${plan.ppNo}">
	                                                <span class="dayAllMapInfoSpan"><%=j%>. ${plan.ppPlaceName}</span>
	                                            </div>
	                                <% ++j;%>
	                                        </c:if>
	
	                                    </c:forEach>
	                            </div>
	                        </c:forEach>
	                    </div>
	                    
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<script>

</script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<script>
// 맵 변경
function mapChange(){
	
    var dayAllMapSelectId = document.getElementById("dayAllMapSelectId");
    var index = dayAllMapSelectId.options[dayAllMapSelectId.selectedIndex].value;
    var dayAllMapClass = document.querySelectorAll(".dayAllMapClass");
    var dayAllMapInfo = document.querySelectorAll(".dayAllMapInfo");

    for(var i = 0; i < dayAllMapClass.length; i++){
    	dayAllMapClass[i].style.display = "none";
    }
    
    dayAllMapClass[index].style.display = "block";

    for(var j = 0; j < dayAllMapInfo.length; j++){
    	dayAllMapInfo[j].style.display = "none";
    }
    
    dayAllMapInfo[index].style.display = "block";
}

// 플래너 삭제
document.querySelectorAll("#btnDeletePlanner").forEach((btn) => {
	btn.addEventListener('click', (e) => {
		console.log(e.target);
		console.log(e.target.dataset.pNo);
		document.plannerDelFrm.pNo.value = e.target.dataset.no;
		document.plannerDelFrm.submit();
	});
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>