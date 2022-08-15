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
					<button type="submit" class="btn btn-primary btn-lg" id="btnModalCreateModal">플래너 작성</button>
					<button type="button" class="btn btn-danger btn-lg" id="btnModalCloseDown" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</form>


<div id="commonMain">
	<div id="bannder">배너 / My플래너</div>
	
<%-- <form name="datesFrm">
        <label for="start">출발</label>
        <input type="date" name="start" id="start" value="2022-09-01">
        <label for="end">도착</label>
        <input type="date" name="end" id="end" value="2022-09-05">
        <button type="submit">제출</button>
    </form> --%>
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
			<div id="plannerInfo">
				<button type="button" id="createPlannerModalbtn" class="btn btn-primary btn-lg">플래너 작성</button>
			</div>
			
			<div id="cardWrapper">
			<c:if test="${empty plannerList}">
		    	<span>작성된 플래너가 없습니다.</span>
	    	</c:if>
	    	
	    	<c:if test="${not empty plannerList}">
				<c:forEach items="${plannerList}" var="planner" varStatus="vs">
					<a href="${pageContext.request.contextPath}/planner/detailPlanner.do?pNo=${planner.PNo}">
						<div class="card" style="width: 18rem;" data-no="${planner.PNo}">
			                <img src="..." class="card-img-top" alt="...">
								<div class="card-body">
									<span class="cardTitleSpan">${planner.PTitle}</span><br />
									<span class="cardExplanSpan">${planner.PExplan}</span>
								</div>
						</div>
					</a>
	            </c:forEach>
            </c:if>
		</div>
	</div>
	
</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<script>
/* document.datesFrm.addEventListener('submit', (e) => {
    e.preventDefault();
    const frm = e.target;
    const _data = {
        start: e.target.start.value,
        end: e.target.end.value
    };
    const data = JSON.stringify(_data);
    console.log(_data);
    $.ajax({
        url: "${pageContext.request.contextPath}/planner/dates",
        method: "POST",
        contentType: "application/json; charset=utf-8",
        data,
        success(response){
            console.log(response);
        },
        error: console.log

    });

 }); */

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