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
	작업 : 이경석, 김용민
 -->

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="글 작성" name="title" />
</jsp:include>
<!-- include libraries(jQuery, bootstrap) -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardplannermodal.css">
<style>
	#content {
		resize : none;
		overflow-y:scroll;
	}
	#save {
		margin-left :45%;
	}
</style>

<div class="createPlannerModalForm">
	<div class="modal-dialog-centered" id="createPlannerModal">
		<div class="modal-content">
			<div class="modal-header">
				<h1>플래너 불러오기</h1>
				<button type="button" class="btn-close" id="btnModalCloseUp" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				
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
									<span class="cardExplanSpan">${planner.PExplan}</span><br />
									<button type="button" class="btn btn-primary plannerChoose" value="${planner.PNo}">플래너 선택</button>
								</div>
							</div>
			            </c:forEach>
		            </c:if>
	            </div>
			</div>
		</div>
	</div>
</div>

<div id="commonMain">
 	<form:form name="boardFrm" action="${pageContext.request.contextPath}/board/friend/friendBoardEnroll.do" method="POST" enctype="multipart/form-data">
		<input type="text" class="form-control" placeholder="제목을 입력해주세요." name="fbTitle" id="title" required>
		<input type="text" class="form-control" name="fbMEmail" value="<sec:authentication property="principal.mEmail"/>" readonly required>
		
		<div class="input-group mb-3">
		  <label class="input-group-text" for="inputGroupFile01">Upload</label>
		  <input type="file" name="upFile" class="form-control" id="inputGroupFile01" multiple>
		</div>
		<button type="button" id="createPlannerModalbtn" class="btn btn-primary btn-lg">플래너 불러오기</button>
		<input type="hidden" id="modalPlannerNo" name="fbPNo" value=""/>
		
	  	<textarea id="summernote" name="fbContent"></textarea>
	  	
		<br /><br />
		<input type="submit" id="save" class="btn btn-primary btn-lg" value="저장" >
		<input type="submit" class="btn btn-primary btn-lg" value="취소" onclick="location.href='${pageContext.request.contextPath}/board/friend/friendBoard.do'">
		<br /><br /><br />
	</form:form>
</div>
<script>
	document.querySelectorAll("[name=upFile]").forEach((input) => {
		input.addEventListener('change', (e) => {
			const [file] = e.target.files;
			console.log(file);
		});
	});

	$('#summernote').summernote({
		placeholder: '내용을 입력하세요.',
		tabsize: 1, // 줄바꿈 간격
		height: 700, // 노트 크기
		disableResizeEditor: true, // 노트 크기 고정
		lang: "ko-KR",
		focus : true, 
		toolbar: [ // 툴바 메뉴들 검색해서 추가 가능
			['style', ['style']],
			['font', ['bold', 'underline', 'clear']],
			['color', ['color']],
			['para', ['ul', 'ol', 'paragraph']],
			['table', ['table']],
			['insert', ['link', 'picture', 'video']],
			['view', ['fullscreen', 'codeview', 'help']]
		]
	});
	
	  
/*  	document.boardFrm.addEventListener('submit', (e) => {
		const title = document.querySelector("#title");
		const content = document.querySelector("#summernote");
	 
		if(!/^.+$/.test(title.value))
		{
			e.preventDefault();
			alert("제목을 작성해주세요.");
			return;
		}
		if(!/^(.|\n)+$/.test(content.value))
		{
			e.preventDefault();
			alert("내용을 작성해주세요.");
			return;
		}
	});  */  
	
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
	
	$('.plannerChoose').click(function(e){
		var plannerNo = e.target.value
		$('input[name=fbPNo]').attr('value', plannerNo);
		alert('플래너가 선택되었습니다 !');
		$('.createPlannerModalForm').removeClass('show-modal');
	})
</script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>





