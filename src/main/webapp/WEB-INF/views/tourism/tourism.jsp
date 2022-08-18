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

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
	
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3b1f2155fb7376c8e3ce304aebd498b">
</script>

<div class="createMapModalForm">
	<div class="modal-dialog-centered" id="createMapModal">
		<div class="modal-content">
			<div class="modal-header">
				<h1>지도</h1>
				<button type="button" class="btn-close" id="btnModalCloseUp"
					data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body1" id="mapModalBody">
				<div class="modalInfo" id="mapData" style="border: 1px solid black; height:600px; width:700px;" >
				</div>
			</div>
		</div>
	</div>
</div>

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
				<div id="bigImg"></div>
				<div id="tourismInfo">
					<div id="tourismInfoTitle"></div>
					<div id="tourismInfoBox">

						<table id="contentTable" class="table table-bordered">
							<tbody>
								<tr id="zipCodeTr">
								</tr>
								<tr id="homepageTr">
								</tr>
								<tr id="addrTr">
								</tr>
							</tbody>
						</table>
					<button type="button" class="btn btn-info" id="mapBtn">지도보기</button>
					</div>
				</div>
			</div>
		<div id="infoBot">
			<ul>
				<li><strong>개요</strong>
					<div id="overview"></div></li>
			</ul>
		</div>
		</div>

	</div>
	<div id="mainlist">
		<a id="mainlistButton" href="${pageContext.request.contextPath}">메인
			화면</a>
	</div>
</div>

<script>

var mapx = "";
var mapy = "";

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

			for(var i = 0; myItem.length > i; i++){
			
				if(myItem[i].firstimage == ""){
					myItem[i].firstimage = '${pageContext.request.contextPath}/resources/images/noImage.png';
				};
			
				var img = "";
				img += '<img src=' + myItem[i].firstimage + ' alt="" id="bigImg2" />';
				console.log(img);
				$('#bigImg').append(img);
				
				mapx += myItem[i].mapx;
				mapy += myItem[i].mapy;
				console.log("mapx ! = " + mapx);
				console.log("mapy ! = " + mapy);
				
				var title = "";
				title += '<p id="title">' + myItem[i].title +'</p>';
				console.log(title);
				$('#tourismInfoTitle').append(title);
				
				var zipCode = "";
				zipCode += '<th id="contentTableTh">우편번호</th> <td>' + myItem[i].zipcode +'</td>';
				console.log(zipCode);
				$('#zipCodeTr').append(zipCode);
				
				var homepageCode = "";
				homepageCode += '<th>홈페이지</th> <td> <div id="contentTableHomepage">' + myItem[i].homepage + '</div> </td>';
				console.log(homepageCode);
				$('#homepageTr').append(homepageCode);
				
				var addrCode = "";
				addrCode += '<th>주소</th> <td> <div>' + myItem[i].addr1 + myItem[i].addr2 + '</div> </td>'
				console.log(addrCode);
				$('#addrTr').append(addrCode);
				
				var overviewCode = "";
				overviewCode += myItem[i].overview;
				console.log(overviewCode);
				$('#overview').append(overviewCode);
				
				console.log("mapx @ = " + mapx);
				console.log("mapy @ = " + mapy);
				/* 지도 생성 */
				var mapContainer = document.getElementById('mapData');
				var mapOption = {
					center : new kakao.maps.LatLng(mapy, mapx),
					level : 3
				};
				var map = new kakao.maps.Map(mapContainer, mapOption);

				/* 마커 생성 */
				var markerPosition = new kakao.maps.LatLng(mapy, mapx);
				var marker = new kakao.maps.Marker({
					position : markerPosition
				});
				marker.setMap(map);
				
			};
		},

		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("Status : " + textStatus);
			alert("Error : " + errorThrown);
		}
	});	

});

document.querySelector('.createMapModalForm').addEventListener('click', function(e) {
	if (e.target == document.querySelector('.createMapModalForm')) {
		document.querySelector('.createMapModalForm').classList.remove('show-modal');
	}
});

$('#mapBtn').on('click', function() {
	$('.createMapModalForm').addClass('show-modal');
});

$('#btnModalCloseUp').on('click', function() {
 
	$('.createMapModalForm').removeClass('show-modal');
	});
	


</script>



<script>

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>