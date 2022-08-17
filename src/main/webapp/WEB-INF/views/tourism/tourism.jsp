a<%@ page language="java" contentType="text/html; charset=UTF-8"
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
				</div>
				<div id="tourismInfo">
					<div id="tourismInfoTitle">
					</div>
					<div id="map"></div>
					<div id="tourismInfoBox">

						<table id="contentTable" class="table table-bordered">
							<caption>관광데이터 기본정보</caption>
							<tbody>
								<tr id="zipCodeTr">
								</tr>
								<tr id="homepageTr">
								</tr>
								<tr id="addrTr">
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>

		<div id="infoBot">
			<ul>
				<li>
				<strong>개요</strong>
					<div id="overview">
					</div>
					</li>
			</ul>
		</div>
	</div>
	<div id="mainlist">
		<a id="mainlistButton"
			href="${pageContext.request.contextPath}">메인 화면</a>
	</div>
</div>

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

			for(var i = 0; myItem.length > i; i++){
			
				if(myItem[i].firstimage == ""){
					myItem[i].firstimage = '${pageContext.request.contextPath}/resources/images/noImage.png';
				};
			
				var img = "";
				img += '<img src=' + myItem[i].firstimage + ' alt="" id="bigImg2" />';
				console.log(img);
				$('#bigImg').append(img);
				
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
				
				
			};
		},

		error : function(XMLHttpRequest, textStatus, errorThrown) {
			alert("Status : " + textStatus);
			alert("Error : " + errorThrown);
		}
	});	

});


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>