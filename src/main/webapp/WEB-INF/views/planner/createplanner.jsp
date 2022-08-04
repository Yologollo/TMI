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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/createplanner.css">
<!-- 
	생성 : 김용민
	작업 : 김용민
 -->
<div id="createPlannerMain">
	<div id=topBar>
		<div id="topBarBtnWrapper">
			<button type="button" class="btn btn-primary btn-lg" id="btnPlannerSave">저장</button>
			<button type="button" class="btn btn-danger btn-lg" id="btnPlannerClose">닫기</button>
		</div>
	</div>
	
	<div id=palnnerInfo>
		<div id="palnnerDate">
			<div id="palnnerDateInfoFirstId">
				<span>일정</span>
			</div>
			<div class="plannerDateInfo">
				<span class="palnnerDateInfoSpanClass">DAY 1</span><br />
				<span>08.04</span>
			</div>
			<div class="plannerDateInfo">
				<span class="palnnerDateInfoSpanClass">DAY 2</span><br />
				<span>08.05</span>
			</div>
		</div>
		<div id="plannerDetailDate">
			<div id="plannerDetailDateInfoFirstId">
				<span>DAY 1 | 08.04 목요일</span>
			</div>
			<div class="plannerDetailDateInfo">
			<button type="button" class="plannerDetailDateInfoClose btn-close"></button>
				<div class="plannerDetailDateInfoTitle">
					<span>1.</span>				
					<span>KH정보교육원</span>
				</div>
				<div class="plannerDetailDateInfoTime">
					<label for="">시간</label>
					<input type="time" class="form-control" placeholder="시간">
				</div>
				<div class="plannerDetailDateInfoMemo">
					<label for="">메모</label>
					<input type="text" class="form-control" placeholder="메모">				
				</div>
			</div>
			<div class="plannerDetailDateInfo">
			<button type="button" class="plannerDetailDateInfoClose btn-close"></button>
				<div class="plannerDetailDateInfoTitle">
					<span>2.</span>				
					<span>야호</span>
				</div>
				<div class="plannerDetailDateInfoTime">
					<label for="">시간</label>
					<input type="time" class="form-control" placeholder="시간">
				</div>
				<div class="plannerDetailDateInfoMemo">
					<label for="">메모</label>
					<input type="text" class="form-control" placeholder="메모">				
				</div>
			</div>
		</div>
		<div id="plannerDetailPlace">
			<div id="plannerDetailPlaceFirstId">
				<div id="plannerDetailPlaceFirstIdWrapper">
					<input type="text" class="form-control" placeholder="검색">
					<button type="button" class="btn btn-primary">검색</button>
				</div>
			</div>
			<div class="plannerDetailPlaceInfo">
				<div class="plannerDetailPlaceInfoImg">
				
				</div>
				<div class="plannerDetailPlaceInfoAddress">
					<span class="plannerDetailPlaceInfoAddressName">KH 정보교육원1</span><br />
					<span class="plannerDetailPlaceInfoAddressinfo">KH 정보교육원1 주소</span><br />
					<span class="plannerDetailPlaceInfoAddressNumber">KH 정보교육원1 전화번호</span>
				</div>
				<div class="plannerDetailPlaceInfoBtn">
					<button type="button" class="btn btn-primary">+</button>
				</div>
			</div>
			<div class="plannerDetailPlaceInfo">
				<div class="plannerDetailPlaceInfoImg">
				
				</div>
				<div class="plannerDetailPlaceInfoAddress">
					<span class="plannerDetailPlaceInfoAddressName">KH 정보교육원2</span><br />
					<span class="plannerDetailPlaceInfoAddressinfo">KH 정보교육원2 주소</span><br />
					<span class="plannerDetailPlaceInfoAddressNumber">KH 정보교육원2 전화번호</span>
				</div>
				<div class="plannerDetailPlaceInfoBtn">
					<button type="button" class="btn btn-primary">+</button>
				</div>
			</div>
		</div>
		<div id="palnneKakaoAPI">
			카카오 API
		</div>
	</div>
	
</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>