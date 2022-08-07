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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detailplanner.css">
<style>
#plannerContainerWrapper {
	border: 1px solid orange;
	display: table;
	width: 100%;
	height: 90%;
}

#plannerDetailWrapper {
	border: 1px solid black;
	width: 70%;
	height: 100%;
	display: table-cell;
}

#plannerAllWrapper {
	border: 1px solid blue;
	width: 30%;
	height: 100%;
	display: table-cell;
}

#plannerAllCard {
	width: 100%;
}

.plannerDetailCard {
	margin: 3%;
}

.plannerDetailCardBody {
	border-bottom: 1px solid #d3d3d3;
	display: table;
	border: 1px solid yellow;
	padding: 2%;
	text-align: center;
}

.plannerDetailCardBodyInfo {
	display: table-cell;
	float: left;
	border: 1px solid red;
	width: 70%;
	height: 15vh;
}

.plannerDetailCardBodyMap {
	display: table-cell;
	float: right;
	border: 1px solid blue;
	width: 30%;
	height: 100%;
}

.plannerDetailCardBody:last-child {
	border-bottom: hidden;
}

.plannerDetailCardDay {
	font-size: 24px;
}

.plannerDetailCardBodyTimeWrapper {
	font-size: 18px;
}

.plannerDetailCardBodyPlaceWrapper {
	margin-bottom: 5%;
	font-size: 32px;
}

.blockquote-footer {
	margin-top: 5%;
}

.plannerDetailCardTime { 
	margin-left: 5%;
}
</style>

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
				<button type="button" id="btnDeletePlanner" class="btn btn-danger btn-lg">삭제</button>
				<button type="button" id="btnUpdatePlanner" class="btn btn-primary btn-lg">수정</button>
			</div>
			<div id="plannerContainerWrapper">
				<div id="plannerDetailWrapper">
					<div class="plannerDetailCard card">
						<div class="card-header">
							<span class="plannerDetailCardDay">DAY 1</span>
							<span class="plannerDetailCardTime">2022.08.05 금요일</span>
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
						</div>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>