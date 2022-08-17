<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<fmt:requestEncoding value="utf-8" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Travel Making Imagine" name="title" />
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tourism.css">

<div id="commonMain">
	<!-- 
	생성 : 전인찬
	작업 : 전인찬
 -->
 <div id="commonMain2">
	<div id="infoBox">
		<!-- 
		<p id="info-box title">고사포해수욕장</p>
		 -->
		<div id="infoTop">
			<div id="slideBox">
				<div id="slideBoxBigImg">
					<img
						src="${pageContext.request.contextPath}/resources/images/tourism/topimg1.jpg"
						alt="" id="bigImg" />
					<div id="slideBoxSlide">
						<button type="button" data-role="none" id="slideBoxPrew"
							style="display: block;">Previous</button>
						<div id="slideBoxList">사진 슬라이드쇼 위치</div>
						<button type="button" data-role="none" id="slideBoxNext"
							style="display: block;">next</button>
					</div>
				</div>
			</div>
			<div id="tourismInfo">
				<p id="tourismInfoTitle">고사포해수욕장</p>
				<div id="tourismInfoTagBox">
					<ul id="tourismInfoThreeTab">
						<li><button type="button" id="tagBox1">기본정보</button></li>
						<li><button type="button" id="tagBox2">이용안내</button></li>
						<li><button type="button" id="tagBox3">상세정보</button></li>
					</ul>
				</div>
				<div id="tabContent1">
					<table id="tabContent1Table" class="table table-bordered">
						<caption>관광데이터 기본정보</caption>
						<tbody>
							<tr>
								<th id="content1TableTh">우편번호</th>
								<td>56339</td>
							</tr>
							<tr>
								<th>홈페이지</th>
								<td>
									<div id="content1TableHomepage">
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
				<div id="tabContent2">
					<strong id="tabContent2Strong">관광지</strong>
					<div id="scrolldown">
						<table id="tabContent2Table" class="table table-bordered">
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
				<div id="tabContent3">
					<div id="scrolldown">
						<table id="tabContent3Table" class="table table-bordered">
							<caption>관광데이터 상세정보</caption>
							<tbody>
								<tr>
									<th id="content3TableTh">화장실</th>
									<td>
										<div style="text-align: initial;">있음</div>
									</td>
								</tr>
								<tr>
									<th id="content3TableTh">이용가능시설</th>
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

		<div id="infoBot">
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
		<a id="mainlistButton"
			href="https://api.visitkorea.or.kr/#/hubTourSearch">목록</a>
	</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<script>

var recieveData = location.href.split('?')[1];
console.log("recieveData = " + recieveData);

$('#tagBox1').on('click', function(){
	console.log('1번박스클릭');
	$('#tabContent1').css('display', 'block');
	$('#tabContent2').css('display', 'none');
	$('#tabContent3').css('display', 'none');	
});

$('#tagBox2').on('click', function(){
	console.log('2번박스클릭');
	$('#tabContent1').css('display', 'none');
	$('#tabContent2').css('display', 'block');
	$('#tabContent3').css('display', 'none');	
});

$('#tagBox3').on('click', function(){
	console.log('3번박스클릭');
	$('#tabContent1').css('display', 'none');
	$('#tabContent2').css('display', 'none');
	$('#tabContent3').css('display', 'block');	
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>