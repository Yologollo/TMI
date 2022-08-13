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
					<div class="plannerDetailCard card">
						
						<c:forEach items="${days}" var="days" varStatus="status">
							<div class="card-header">
								<span class="plannerDetailCardDay">DAY ${status.count}</span>
								<span class="plannerDetailCardTime"><fmt:formatDate value="${days}" pattern="yyyy.MM.dd E" />요일</span>
							</div>
						
							<% int i = 1;%>
							<c:forEach items="${plans}" var="plan" varStatus="plan_status">
								<fmt:formatDate value="${days}" pattern="yyyy-MM-dd" var="nowDate" />
	                            <fmt:formatDate value="${plan.ppDate}" pattern="yyyy-MM-dd" var="openDate" />

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
									<div class="plannerDetailCardBodyMap">
		
									</div>
								</div>
							 <% ++i;%>
							 	</c:if>
							</c:forEach>
						</c:forEach>
						
						<!-- <div class="plannerDetailCardBody card-body">
							<div class="plannerDetailCardBodyInfo">
								<blockquote class="blockquote mb-0">
									<div class="plannerDetailCardBodyTimeWrapper">
										<span class="plannerDetailCardBodyTime">오전 11:22</span>
									</div>
									<div class="plannerDetailCardBodyPlaceWrapper">
										<span class="plannerDetailCardBodyPlaceNumber">1. </span>
										<span class="plannerDetailCardBodyPlace">장소</span>
									</div>
									<footer class="blockquote-footer">
										<span class="plannerDetailCardBodyMemo">메모</span>
									</footer>
								</blockquote>
							</div>
							<div class="plannerDetailCardBodyMap">

							</div>
						</div>
						<div class="plannerDetailCardBody card-body">
							<div class="plannerDetailCardBodyInfo">
								<blockquote class="blockquote mb-0">
									<div class="plannerDetailCardBodyTimeWrapper">
										<span class="plannerDetailCardBodyTime">오전 11:22</span>
									</div>
									<div class="plannerDetailCardBodyPlaceWrapper">
										<span class="plannerDetailCardBodyPlaceNumber">1. </span>
										<span class="plannerDetailCardBodyPlace">장소</span>
									</div>
									<footer class="blockquote-footer">
										<span class="plannerDetailCardBodyMemo">메모</span>
									</footer>
								</blockquote>
							</div>
							<div class="plannerDetailCardBodyMap">

							</div>
						</div>
						
						<div class="card-header">
							<span class="plannerDetailCardDay">DAY 2</span>
							<span class="plannerDetailCardTime">2022.08.06 토요일</span>
						</div>
						<div class="plannerDetailCardBody card-body">
							<div class="plannerDetailCardBodyInfo">
								<blockquote class="blockquote mb-0">
									<div class="plannerDetailCardBodyTimeWrapper">
										<span class="plannerDetailCardBodyTime">오전 11:22</span>
									</div>
									<div class="plannerDetailCardBodyPlaceWrapper">
										<span class="plannerDetailCardBodyPlaceNumber">1. </span>
										<span class="plannerDetailCardBodyPlace">장소</span>
									</div>
									<footer class="blockquote-footer">
										<span class="plannerDetailCardBodyMemo">메모</span>
									</footer>
								</blockquote>
							</div>
							<div class="plannerDetailCardBodyMap">

							</div>
						</div>
						<div class="plannerDetailCardBody card-body">
							<div class="plannerDetailCardBodyInfo">
								<blockquote class="blockquote mb-0">
									<div class="plannerDetailCardBodyTimeWrapper">
										<span class="plannerDetailCardBodyTime">오전 11:22</span>
									</div>
									<div class="plannerDetailCardBodyPlaceWrapper">
										<span class="plannerDetailCardBodyPlaceNumber">1. </span>
										<span class="plannerDetailCardBodyPlace">장소</span>
									</div>
									<footer class="blockquote-footer">
										<span class="plannerDetailCardBodyMemo">메모</span>
									</footer>
								</blockquote>
							</div>
							<div class="plannerDetailCardBodyMap">

							</div>
						</div> -->
					</div>
				</div>
				<div id="plannerAllWrapper">
					<div class="card" id="plannerAllCard">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text">지도 정보</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<script>
// 플래너 삭제
document.querySelectorAll("#btnDeletePlanner").forEach((btn) => {
	btn.addEventListener('click', (e) => {
		console.log(e.target);
		console.log(e.target.dataset.pNo);
		document.plannerDelFrm.pNo.value = e.target.dataset.no;
		document.plannerDelFrm.submit(); // submit 이벤트핸들러를 호출하지 않는다.
	});
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>