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
		overflow-y:scroll;
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
    	font-size : 50px;
    }
    .comment-writer {
    	font-size : 20px;
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
<input type="hidden" class="form-control" name="loginMemberEmail" id="loginMemberEmail" value="${loginMember.MEmail}" required readonly>

<script>
const email = document.getElementById("loginMemberEmail").value;
</script>




<div id="commonMain" style="text-align : center; border: none; box-shadow: 1px 1px 3px 1px #dadce0;">
		<input type="hidden" class="form-control" name="loginMemberEmail" id="loginMemberEmail" value="${loginMember.MEmail}" required readonly>
		<input type="hidden" class="form-control" name="rbNo" id="no" value="${insertReviewBoard.rbNo}" required>
		<input type="text" class="form-control" name="rbTitle" id="title" value="${insertReviewBoard.rbTitle}" style="font-size : 50px;" required readonly>
 		<input type="text" class="form-control" name="rbMEmail" value="${insertReviewBoard.rbMEmail}" readonly required>
		
		<label class="input-group-text" for="inputGroupFile01">첨부파일</label>
		<c:if test="${not empty insertReviewBoard.attachments}">
			<c:forEach items="${insertReviewBoard.attachments}" var="attach">
				<div class="btn-group-toggle pb-1" data-toggle="buttons">
					<button type="button" id="downloadFile" class="btn btn-outline-success attach" value="${attach.rbaNo}">${attach.rbaOriginalFilename}</button>
				</div>
			</c:forEach>
		</c:if>
		
		<c:forEach items="${insertReviewBoard.planner}" var="planner">	
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
							<c:forEach items="${insertReviewBoard.plans}" var="plan" varStatus="plan_status">
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
							    
							    
								 <c:forEach items="${insertReviewBoard.plans}" var="plan" varStatus="plan_status">
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
	
	                                     <c:forEach items="${insertReviewBoard.plans}" var="plan" varStatus="plan_status">
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
			</c:if>
		</c:forEach>
		<div id="contentMain">
	  		${insertReviewBoard.rbContent} <!-- summernote 출력 -->
	  	</div>
	  	<br /><br />
		
         <form
			 action="${pageContext.request.contextPath}/board/review/reviewBoardLove.do" method="get" name="reviewBoardLoveFrm">
             <input type="hidden" name="loNo" value="${insertReviewBoard.rbNo}" />
             <p style="font-size : 40px;"><img src="${pageContext.request.contextPath}/resources/images/like.png" style="width : 45px; height : 45px; margin-top : -5px;"/>${loveCount}</p>
             <c:if test="${empty loginMember}">
				<span>로그인 하셔야 추천이 가능합니다.</span>
			</c:if>
			<c:if test="${not empty loginMember && (loginMember.MEmail eq insertReviewBoard.rbMEmail)}">
             	<span>본인 글은 추천할 수 없습니다.</span>
            </c:if>
			<c:if test="${not empty loginMember && (loginMember.MEmail ne insertReviewBoard.rbMEmail)}">
             	<button type="submit" class="btn btn-primary btn-lg" id="love">추천</button>
            </c:if>
         </form>
         <hr />

				<!--table#tbl-comment-->
				 <c:if test="${insertReviewBoard.comments ne null && not empty insertReviewBoard.comments}">
					<table id="tbl-comment">
						<tbody>
						<c:forEach items="${insertReviewBoard.comments}" var="comment">
							<tr class="level1">
								<td>
								<hr / class="commentHr">
									<sub class="comment-writer">${comment.rbcMEmail}</sub>
									<sub class="comment-date">${comment.rbcCreatedAt}</sub>
									<hr / class="commentHr">
									<br />
									<div id="size">
									${comment.rbcContent}
									</div>
									<form action="${pageContext.request.contextPath}/board/review/deleteComment.do" method="get" name="reviewBoardCommentDeleteFrm">
										<input type="hidden" name="rbcFbNo" value="${insertReviewBoard.rbNo}" />
										<input type="hidden" name="rbcNo" value="${comment.rbcNo}" />
										<c:if test="${(not empty loginMember && (loginMember.MEmail eq comment.rbcMEmail)) || (loginMember.MEmail eq 'admin@naver.com')}">
										<div class="d-grid gap-2 col-6 mx-auto">
					                		<button type="submit" id="deleteComment" class="btn-danger" style="font-size : 25px;">삭제</button>
					                	</div>
					                	</c:if>
									</form>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				 </c:if> 
				 
		<%-- <c:if test="${not empty loginMember && (loginMember.MEmail eq insertFriendBoard.fbMEmail)}"> --%>
		<c:if test="${not empty loginMember}">
			<div class="comment-container">
		        <div class="comment-editor">
		            <form
						action="${pageContext.request.contextPath}/board/review/reviewBoardCommentEnroll.do" method="post" name="reviewBoardCommentFrm">
		                <input type="hidden" name="rbcRbNo" value="${insertReviewBoard.rbNo}" />
		                <input type="hidden" name="rbcMEmail" value="${loginMember != null ? loginMember.MEmail : ""}" />
		                <br />
						<textarea name="rbcContent" cols="85" rows="3" style="resize: none;" placeholder="댓글 입력"></textarea>
		                <button type="submit" class="btn btn-primary btn-lg" style="width : 75px; height : 75px; margin-bottom : 66px; margin-right : -15px;">등록</button>
		            </form>
		        </div>
		</c:if>
		
		<c:if test="${(not empty loginMember && (loginMember.MEmail eq insertReviewBoard.rbMEmail)) || (loginMember.MEmail eq 'admin@naver.com')}">
			<button style="float : right;" type="button" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/review/reviewBoardDelete.do?no=${insertReviewBoard.rbNo}';">삭제</button>
			<button style="float : right; margin-right : 10px;" type="button" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath}/board/review/reviewBoardUpdate.do?no=${insertReviewBoard.rbNo}';">수정</button>
		</c:if>
		
		<br /><br /><br />
		<input style="float : right;" type="submit" class="btn btn-primary btn-lg" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/board/review/reviewBoard.do'">
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
 			location.href = `${pageContext.request.contextPath}/board/review/fileDownload.do?no=\${attachNo}`;
 		});
 	});

 	document.reviewBoardCommentFrm.onsubmit = (e) => {
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





