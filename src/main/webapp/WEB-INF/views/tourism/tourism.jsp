<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<fmt:requestEncoding value="utf-8" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Travel Making Imagine" name="title" />
</jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tourism.css">

<div id="commonMain">
	<!-- 
	생성 : 전인찬
	작업 : 전인찬
 -->
 <div id="commonMain2">
	<div id="info-box">
		<!-- 
		<p id="info-box title">고사포해수욕장</p>
		 -->
		<div id="info-top">
			<div id="slide-box">
				<div id="slide-box_big-img">
					<img
						src="${pageContext.request.contextPath}/resources/images/tourism/topimg1.jpg"
						alt="" id="big-img" />
					<div id="slide-box_slide">
						<button type="button" data-role="none" id="slide-box_prew"
							style="display: block;">Previous</button>
						<div id="slide-box_list">사진 슬라이드쇼 위치</div>
						<button type="button" data-role="none" id="slide-box_next"
							style="display: block;">next</button>
					</div>
				</div>
			</div>
			<div id="tourism-info">
				<p id="tourism-info title">고사포해수욕장</p>
				<div id="tourism-info_tag-box">
					<ul id="tourism-info_three-tab">
						<li id="on"><button type="button">기본정보</button></li>
						<li id=""><button type="button">이용안내</button></li>
						<li id=""><button type="button">상세정보</button></li>
						<li id="on-back"></li>
					</ul>
				</div>
				<div id="tab-content1_on">
					<table id="tab-content1 table">
						<caption>관광데이터 기본정보</caption>
						<tbody>
							<tr>
								<th id="content1 table-th">우편번호</th>
								<td>56339</td>
							</tr>
							<tr>
								<th>홈페이지</th>
								<td>
									<div id="content1 table-homepage">
										<a href="http://www.buan.go.kr/tour">
											http://www.buan.go.kr/tour </a>
									</div>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<div>전라북도 부안군 변산면 노루목길 8-8&nbsp;(변산면)</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="tab-content2">
					<strong id="tab-content2 strong">관광지</strong>
					<div id="scrolldown">
						<table id="tab-content2 table">
							<caption>관광데이터 이용안내</caption>
							<tbody>
								<tr>
									<th>문의 및 안내</th>
									<td>
										<div>063-582-7808</div>
									</td>
								</tr>
								<tr>
									<th>쉬는날</th>
									<td>연중무휴</td>
								</tr>
								<tr>
									<th>체험가능연령</th>
									<td>만 5세 이상</td>
								</tr>
								<tr>
									<th>주차시설</th>
									<td>있음</td>
								</tr>
								<tr>
									<th>유모차 대여 여부</th>
									<td>없음</td>
								</tr>
								<tr>
									<th>애완동물 동반가능여부</th>
									<td>가능</td>
								</tr>
								<tr>
									<th>신용카드 가능 여부</th>
									<td>없음</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div id="tab-content3">
					<div id="scrolldown">
						<table id="tab-content3 table">
							<caption>관광데이터 상세정보</caption>
							<tbody>
								<tr>
									<th id="content3 table-th">화장실</th>
									<td>
										<div style="text-align: initial;">있음</div>
									</td>
								</tr>
								<tr>
									<th id="content3 table-th">이용가능시설</th>
									<td>
										<div style="text-align: initial;">음수대, 샤워장(해수욕장 개장기간만 이용
											가능)</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div id="info-bot">
			<ul>
				<li><strong>개요</strong>
					<p>
					<div>
						부안군 변산면 운산리에 있는 해수욕장으로 약 2km에 이르는 백사장과 방풍림으로 심어 놓은 송림이 장관을 이룬다.
						일대의 해수욕장 중에서 가장 맑고 깨끗하며 모래도 곱고 부드럽다. 해수욕장 앞에는 웅크리고 있는 새우모습을 닮은
						하섬(蝦島)이 있는데 매월 음력 초하루와 보름쯤에는 모세의 기적처럼 2km의 바닷길이 열리는 체험도 즐길 수 있다.<br>
					</div>
					</p></li>
			</ul>
		</div>
	</div>
	<div id="mainlist">
		<a id="mainlist-button"
			href="https://api.visitkorea.or.kr/#/hubTourSearch">목록</a>
	</div>
	</div>
</div>
<script
	src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>