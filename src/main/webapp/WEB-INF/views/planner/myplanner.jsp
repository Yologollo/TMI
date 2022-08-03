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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/planner.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myplanner.css">
<style>

</style>
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
					<input type="text" class="form-control" id="travelTitle" placeholder="여행 제목">
				</div>
				<div class="modalInfo" id="travelTimeWrapper">
					<div id="travelTimeStartWrapper">
						<label for="travelTime">여행 기간</label>
						<input type="date" class="travelTimeClass form-control" id="travelTimeStart" placeholder="출발">					
					</div>
					<div id="travelTimeEndWrapper">				
						<span> ~</span>
						<input type="date" class="travelTimeClass form-control" id="travelTimeEnd" placeholder="도착">
					</div>
				</div>
				<div class="modalInfo" id="travelMemoWrapper">
					<label for="travelMemo">설명</label>
					<input type="text" class="form-control"id="travelMemo" placeholder="설명">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary btn-lg" id="btnModalCreateModal" onclick="location.href='${pageContext.request.contextPath}/planner/createPlanner.do'">플래너 작성</button>
				<button type="button" class="btn btn-danger btn-lg" id="btnModalCloseDown" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>


<div id="commonMain">
<!-- 
	생성 : 김용민
	작업 : 김용민
 -->
	<div id="bannder">배너 / My플래너</div>
	<div id="wrapper">
		<div id="menuContainer">
			<ul>
				<li class="plannerMenuli">
					<a href="${pageContext.request.contextPath}/planner/myPlanner">My 플래너</a>
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
				<div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">플래너</p>
					</div>
				</div>
				<div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">플래너</p>
					</div>
				</div>
				<div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">플래너</p>
					</div>
				</div>
				<div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">플래너</p>
					</div>
				</div>
				<div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">플래너</p>
					</div>
				</div>
				<div class="card" style="width: 18rem;">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<p class="card-text">플래너</p>
					</div>
				</div>
			</div>
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
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>