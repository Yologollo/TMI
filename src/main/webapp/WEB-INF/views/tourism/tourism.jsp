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

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<script>

var contentId = location.href.split('?')[1];
console.log("contentId = " + contentId);


$(document).ready(function(){
	
	console.log("contentId = " + contentId);

	$.ajax({
		url : '${pageContext.request.contextPath}/tourism/callDetailCommon.do',
		type : 'get',
		data : {
			contentId : contentId
		},
		dataType : 'json',
		success : function(data) {

			var myItem = data.response.body.items.item;
			console.log(myItem);
			
		},

		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("Status : " + textStatus);
			alert("Error : " + errorThrown);
		}
	});	

});


</script>


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
					<div id="bigImg">
						<img
							src="${pageContext.request.contextPath}/resources/images/tourism/topimg1.jpg"
							alt="" id="bigImg2" />
					</div>
				<div id="tourismInfo">
					<p id="tourismInfoTitle">고사포해수욕장</p>
					<div id="tourismInfoBox">
						
						<table id="contentTable" class="table table-bordered">
							<caption>관광데이터 기본정보</caption>
							<tbody>
								<tr>
									<th id="contentTableTh">우편번호</th>
									<td>56339</td>
								</tr>
								<tr>
									<th>홈페이지</th>
									<td>
										<div id="contentTableHomepage">
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

<script>

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>