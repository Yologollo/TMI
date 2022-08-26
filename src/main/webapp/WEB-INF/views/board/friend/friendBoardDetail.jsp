<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="utf-8" />
<!-- 
	생성 : 이경석
	작업 : 이경석
 -->

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="상세보기" name="title" />
</jsp:include>
<!-- include libraries(jQuery, bootstrap) -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detailplanner.css?after">
<style>
	#fb_content {
		resize : none;
	}
	#save {
		margin-left :45%;
	}
	#downloadFile {
		width : 100%;
	}
	
	#contentMain{
    overflow: hidden;
    position: relative;
    box-shadow: 1px 1px 3px 1px #dadce0;
    border-bottom-right-radius: 30px;
    border-bottom-left-radius: 30px;
	}

    #size {
    	font-size : 20px;
    }
    .comment-writer {
    	font-size : 16px;
    }
    .comment-date  {
	  	font-size : 10px;
    }
    
    #comment {
    	border-top: dotted 1px black;
    	border-bottom: dotted 1px black;
    }
    
    .commentHr {
   	width : 1350px;
    }
   	.btn-lg {
    border-color: #70B9E9;
    font-weight: 700;
    background-color: #70B9E9;
    color: white;
	}
</style>
<script>
//DAY 1 지도 도출
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
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="loginMember" scope="page"/>
	<script>
		const mEmail = '${loginMember.MEmail}';
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${pageContext.request.contextPath}/resources/js/ws.js"></script>
</sec:authorize>
	<div id="plannerBtn_p">
		<div id="plannerBtn_c1">
			<input style="float : right;" type="submit" class="btn-lg" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/board/planner/plannerBoard.do'">
		</div>
	</div>
	<br />
	<div style="float:right">
		<form name="boardSaveFrm" action="${pageContext.request.contextPath}/board/planner/plannerBoardSave.do" method="POST">
			<c:forEach items="${insertPlannerBoard.plans}" var="plan" varStatus="plan_status">
				<input type="hidden"  name="ppTime"  value="${plan.ppTime}" required>
				<input type="hidden"  name="ppPlaceName"  value="${plan.ppPlaceName}" required>
				<input type="hidden"  name="ppMemo"  value="${plan.ppMemo}" required>
				<input type="hidden"  name="ppX"  value="${plan.ppX}" required>
				<input type="hidden"  name="ppY"  value="${plan.ppY}" required>
				<input type="hidden"  name="ppDate"  value="${plan.ppDate}" required>
			</c:forEach>
			
			
			<c:forEach items="${insertPlannerBoard.planner}" var="planner">	
				<c:if test="${planner.PNo eq 0}">
				</c:if>
					<c:if test="${planner.PNo ne 0}">
						<c:if test="${(not empty loginMember && (loginMember.MEmail ne insertPlannerBoard.pbMEmail))}">
							<input type="hidden"  name="PNo" id="no11" value="${planner.PNo}" required>
							<input type="hidden"  name="PTitle" id="no2" value="${planner.PTitle}" required>
							<input type="hidden"  name="PExplan" id="no3" value="${planner.PExplan}" required>
							<input type="hidden"  name="PleaveDate" id="no4" value="${planner.PLeaveDate}" required>
							<input type="hidden"  name="PReturnDate" id="no5" value="${planner.PReturnDate}" required>
							<input type="hidden"  name="PwriteDate" id="no6" value="${planner.PWriteDate}" required>
							<button style="float : right;" type="submit" class="btn-lg">플래너 가져오기</button>
							<br /><br /><br />
						</c:if>
					</c:if>
			</c:forEach>
		</form>
	</div>
<div id="commonMain" style="text-align : center; border: none; box-shadow: 1px 1px 3px 1px #dadce0;">
		<input type="hidden" class="form-control" name="fbNo" id="no" value="${insertFriendBoard.fbNo}" required>
		<input type="text" class="form-control" name="fbTitle" id="title" value="${insertFriendBoard.fbTitle}" style="font-size : 50px;" required readonly>
 		<input type="text" class="form-control" name="fbMEmail" value="${insertFriendBoard.fbMEmail}" readonly required>
		
		<label class="input-group-text" for="inputGroupFile01">첨부파일</label>
		<c:if test="${not empty insertFriendBoard.attachments}">
			<c:forEach items="${insertFriendBoard.attachments}" var="attach">
				<div class="btn-group-toggle pb-1" data-toggle="buttons">
					<button type="button" id="downloadFile" class="btn btn-primary-success attach" value="${attach.fbaNo}">${attach.fbaOriginalFilename}</button>
				</div>
			</c:forEach>
		</c:if>
		<br /><br />
		<hr />
		<c:forEach items="${insertFriendBoard.planner}" var="planner">	
			<c:if test="${planner.PNo eq 0}">
			</c:if>
			
		<c:if test="${planner.PNo ne 0}">
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
									<c:forEach items="${insertFriendBoard.plans}" var="plan" varStatus="plan_status">
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
				
				<div id="plannerAllWrapper" style="margin-top : -15px;">
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
							    
							    
								 <c:forEach items="${insertFriendBoard.plans}" var="plan" varStatus="plan_status">
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
					</div>
						
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
	
	                                     <c:forEach items="${insertFriendBoard.plans}" var="plan" varStatus="plan_status">
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
			</c:if>
		</c:forEach>
		<div id="contentMain">
		  	${insertFriendBoard.fbContent}<!-- summernote 출력 -->		
		</div>
		<br /><br />
				<!--table#tbl-comment-->
				 <c:if test="${insertFriendBoard.comments ne null && not empty insertFriendBoard.comments}">
					<table id="tbl-comment">
						<tbody align="left">
						<c:forEach items="${insertFriendBoard.comments}" var="comment">
							<tr class="level1">
								<td>
									<hr / class="commentHr">
									<p class="comment-writer" style="margin-bottom:0px;">${comment.fbcMEmail}</p>
									<div id="size">
										${comment.fbcContent}
									</div>
									<p class="comment-date" style="margin-bottom:0px;">${comment.fbcCreatedAt}</p>
									<form action="${pageContext.request.contextPath}/board/friend/deleteComment.do" method="get" name="friendBoardCommentDeleteFrm">
										<input type="hidden" name="fbcFbNo" value="${insertFriendBoard.fbNo}" />
										<input type="hidden" name="fbcNo" value="${comment.fbcNo}" />
										<c:if test="${(not empty loginMember && (loginMember.MEmail eq comment.fbcMEmail)) || (loginMember.MEmail eq 'admin@naver.com')}">
										<button type="submit" id="deleteComment" class="deleteBtn">삭제</button>
					                	</c:if>
									</form>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				 </c:if>
				 
		<c:if test="${not empty loginMember}">
			<div class="comment-container">
		        <div class="comment-editor">
		            <form
						action="${pageContext.request.contextPath}/board/friend/friendBoardCommentEnroll.do" method="post" name="friendBoardCommentFrm">
		                <input type="hidden" name="fbcFbNo" value="${insertFriendBoard.fbNo}" />
		                <input type="hidden" name="fbcMEmail" value="${loginMember != null ? loginMember.MEmail : ""}" />
		                <br />
						<textarea name="fbcContent" cols="85" rows="3"  style="resize: none;" placeholder="댓글 입력"></textarea>
		                <button type="submit" class="btn btn-primary-success attach" style="width : 70px; height : 75px; margin-bottom : 66px; margin-right : -15px;">등록</button>
		            </form>
		        </div>
		    </div>
		</c:if>
			
		
		<c:if test="${(not empty loginMember && (loginMember.MEmail eq insertFriendBoard.fbMEmail)) || (loginMember.MEmail eq 'admin@naver.com')}">
			<button style="float : right;" type="button" class="btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoardDelete.do?no=${insertFriendBoard.fbNo}';">삭제</button>
			<button style="float : right; margin-right : 10px;" type="button" class="btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoardUpdate.do?no=${insertFriendBoard.fbNo}';">수정</button>
		</c:if>
		<br /><br /><br />
		<c:if test="${(not empty loginMember && (loginMember.MEmail ne insertFriendBoard.fbMEmail))}">
			<input style="float : right; margin-right : 10px;" type="submit" class="btn-lg" value="채팅하기" onclick="location.href='${pageContext.request.contextPath}/chat/chatRoom.do?email=${insertFriendBoard.fbMEmail}';">
		</c:if>
		<br /><br /><br />
</div>

<script>
	document.querySelectorAll("[name=upFile]").forEach((input) => {
		input.addEventListener('change', (e) => {
			const [file] = e.target.files;
			console.log(file);
		});
	});

 	$('#summernote').summernote({
		tabsize: 1, // 줄바꿈 간격
		height: 700, // 노트 크기
		disableResizeEditor: true, // 노트 크기 고정
		lang: "ko-KR",
		toolbar: [ // 상세보기에서는 툴바 삭제
			[],
			[],
			[],
			[],
			[],
			[],
			[]
		]
	}); 
 	
 	document.querySelectorAll(".attach").forEach((btn) => {
 		btn.addEventListener("click", (e) => {
 			const attachNo = e.target.value;
 			console.log(attachNo);
 			location.href = `${pageContext.request.contextPath}/board/friend/fileDownload.do?no=\${attachNo}`;
 		});
 	});

 	document.friendBoardCommentFrm.onsubmit = (e) => {
 		const contentVal = e.target.fbcContent.value.trim();
 		if(!/^(.|\n)+$/.test(contentVal))
 		{
 			alert("댓글 내용을 입력하세요.");
 			return false;
 		}
 	};
 	
  	document.querySelectorAll("#deleteComment").forEach((del) => {
 		del.addEventListener("click", (e) => {		
 			if(!confirm("삭제하시겠습니까?"))
 			{
 				e.preventDefault();			
 			}
 		});
 	}); 

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
</script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>





