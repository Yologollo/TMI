<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<style>
#video_area {
	width: 25%;
}

#background_video {
	max-width: 100%;
	height: auto;
}

#bestPlanner {
	width: 100%;
	height: 75%;
	margin: auto;
	overflow: hidden;
}

#bestReview {
	width: 100%;
	height: 75%;
	margin: auto;
	overflow: hidden;
}



.reviewBoard {
	width: 200px;
	height: 250px;
	margin: auto;
	margin-top: 4.5rem;
	overflow: hidden;
	position: relative;
}

.imageReviewBoard {
	width: 200px;
	height: 180px;
	margin: auto;
	overflow: hidden;
	position: relative;
}

.thumbNailLink {
	display: inline-block;
	margin: 10px;
	width: 300px;
	height: 200px;
	text-align: center;
}

.thumbNailName {
	display: inline-block;
	width: 300px;
	height: 65px;
	text-align: center;
}

#contentArea3 {
	width : 280px;
	height : 330px;
	border: 1px solid black; 
	overflow: hidden;
	margin-right : 20px;
	margin-bottom : 20px;
	box-shadow: 5px 5px 5px gray;
	display: inline-block;
}

#bestReview > h1, #bestPlanner > h1, #tourism_title {
	color: #4a4a4a;
	font-family: 'Nanum+Gothic';
	text-align: center;
}

#thumbNail {
	width : 280px;
	height : 250px;
	border: 1px solid black; 
	margin: auto; 
	overflow: hidden;
	display: inline-block;
}	

.thumbNailName2 {
	display : inline-block;
	width : 280px;
	height : 30px;
	text-align: center;
}

#plannerContainer{
	margin-top:2%;
	margin-bottom:1.5%;
	padding:0 2% 0 2%;
}
#infoMain_planner {
   width:98%; 
   hegiht:100%; 
   margin: 2% 1% 10% 1%; 
   overflow: hidden;
   position: relative;
   box-shadow: 1px 1px 3px 1px #dadce0;
   border-radius: 30px;
}
#board-container{
	margin-top:2%;
	margin-bottom:1.5%;
}
#infoMain_review{
	width:98%; 
	hegiht:100%; 
	margin: 2% 1% 10% 1%; 
	overflow: hidden;
	position: relative;
	box-shadow: 1px 1px 3px 1px #dadce0;
	border-radius: 30px;
}
.bestSubtile{
	font-size: 1.1rem;
	line-height: 1.4;
	color: #999;
	font-family: 'Nanum+Gothic';
	margin-top: 20px;
}

</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tourism.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myplannermain.css?after">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/thumbnailboard.css"> --%>
    <div id="video_area">
        <video src="${pageContext.request.contextPath}/resources/video/mainPage.mp4" id="background_video" auto autoplay loop muted volume="0"></video>
    </div>
    
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="Travel Making Imagine" name="title" />
</jsp:include>
<div id="mainpage_wrap">
	<div id="mainpage_content">
	
<!-- 
    ?????? : ?????????, ?????????, ?????????, ?????????
    ?????? : ?????????, ?????????, ?????????, ?????????
 -->

  
<!-- ???????????? ?????? ?????? -->


<!-- ?????? ?????? ?????? -->
<div class="createAreaModalForm">
	<div class="modal-dialog-centered modal-dialog-scrollable" id="createAreaModal">
		<div class="modal-content">
			<div class="modal-header">
				<h1>??????</h1>
				<button type="button" class="btn-close" id="areaModalCloseBtn" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="modalInfo" id="areaList"></div>
				<div class="modalInfo" id="sigunguList"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary btn-lg" id="areaConfirmBtn">??????</button>
				<button type="button" class="btn btn-outline-secondary btn-lg" id="areaCancelBtn" data-bs-dismiss="modal">??????</button>
			</div>
		</div>
	</div>
</div>
		
<!-- ???????????? ?????? ?????? -->		
<div class="createContentModalForm">
	<div class="modal-dialog-centered modal-dialog-scrollable" id="createContentModal">
		<div class="modal-content">
			<div class="modal-header">
				<h1>????????????</h1>
				<button type="button" class="btn-close" id="contentModalCloseBtn" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="modalInfo" id="contentList"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary btn-lg" id="contentConfirmBtn">??????</button>
				<button type="button" class="btn btn-outline-secondary btn-lg" id="contentCancelBtn" data-bs-dismiss="modal">??????</button>
			</div>
		</div>
	</div>
</div>

<!-- ??????????????? ?????? ?????? -->		
<div class="createServiceModalForm">
	<div class="modal-dialog-centered modal-dialog-scrollable" id="createServiceModal">
		<div class="modal-content">
			<div class="modal-header">
				<h1>????????? ?????? ??????</h1>
				<button type="button" class="btn-close" id="serviceModalCloseBtn" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="modalInfo" id="serviceCat1List"></div>
				<div class="modalInfo" id="serviceCat2List"></div>
				<div class="modalInfo" id="serviceCat3List"></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-primary btn-lg" id="serviceConfirmBtn">??????</button>
				<button type="button" class="btn btn-outline-secondary btn-lg" id="serviceCancelBtn" data-bs-dismiss="modal">??????</button>
			</div>
		</div>
	</div>
</div>

<div style="width:auto; height:100vh; display:flex; margin:auto 0;"></div>
	    
	    <!-- ????????? ????????? ?????? -->
	<div id="indexMain">   
        <div id="bestPlanner" style="text-align : center;">
		    <h1 id="tourism_title">?????? ????????????</h1>
		    <div class="bestSubtile">??? ??????????????? ????????? ?????????????</div>
		    <br />
		    <div id="infoMain_planner">
						<div id="wrapper">
						<div id="plannerContainer">
						<c:forEach items="${plannerList}" var="plannerBoard" varStatus="vs">
							<div class="card" style="width: 18rem; display:inline-block; box-shadow: 1px 1px 3px 1px #dadce0; margin-right : 10px; margin-bottom : 10px;" data-no="${plannerBoard.PNo}">
								<div class="dayAllMapClass" id="dayAllMap${vs.count}"></div>
									<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3b1f2155fb7376c8e3ce304aebd498b"></script>
									<script>
										var mapContainer = document.getElementById('dayAllMap${vs.count}');
										
										var mapOption = {
									    		center: new kakao.maps.LatLng(36.25, 127.75),
										        level: 14
										};
										
										var map = new kakao.maps.Map(mapContainer, mapOption);
										
										var polyline = new kakao.maps.Polyline({
						                       map: map,
						                       path: [],
						                       strokeWeight: 3,
						                       strokeColor: '#5882fa',
						                       strokeOpacity: 1,
						                       strokeStyle: 'solid'
						                   });
										
										<c:forEach items="${plans}" var="plan" varStatus="status">
											<c:if test="${plannerBoard.PNo eq plan.pppNo}">
												var markerPosition  = new kakao.maps.LatLng(${plan.ppY}, ${plan.ppX});
				                                var marker = new kakao.maps.Marker({
				                                    position: markerPosition
				                                });
				                                marker.setMap(map);
				                                
				                                var point =  new kakao.maps.LatLng(${plan.ppY}, ${plan.ppX});
				                                var path = polyline.getPath();
				                                path.push(point);
				                                polyline.setPath(path);
											</c:if>
										</c:forEach>
									</script>
				                <a href="${pageContext.request.contextPath}/board/planner/plannerBoardDetail.do?no=${plannerBoard.pb_no}">
									<div class="card-body">
										<span class="cardDateSpan" style="color : black;">${plannerBoard.PLeaveDate} ~ ${plannerBoard.PReturnDate}</span>
										<span class="cardDaySpan" style="color : black;">
											<fmt:parseDate  value="${plannerBoard.PLeaveDate}" var="leaveDateFormat" pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${leaveDateFormat}" pattern="dd" var="leaveDate" />
											<fmt:parseDate value="${plannerBoard.PReturnDate}" var="returnDateFormat" pattern="yyyy-MM-dd"/>
											<fmt:formatDate value="${returnDateFormat}" pattern="dd" var="returnDate" />
											${returnDate - leaveDate} DAY
										</span><br />
										<span class="cardTitleSpan" style="color : black;">${plannerBoard.pb_title}</span><br />
									</div>
								</a>
							</div>
						</c:forEach>
						</div>
						</div>
						</div>
        		</div>
              
            
            <div id="bestReview" style="text-align : center;">
	        <h1 id="tourism_title">?????? ????????? ??????</h1>
	        <div class="bestSubtile">?????? ????????? ????????? ???????????? ???????????????????</div>
	        <br />
	        <div id="infoMain_review">
	 			<section id="board-container" class="container">
					<article>
						<c:forEach items="${list4}" var="reviewBoard" varStatus="vs">
								<div id="contentArea3">
									<div id="selectContent2">
										<a href="${pageContext.request.contextPath}/board/review/reviewBoardDetail.do?no=${reviewBoard.rb_no}">
											<div id="thumbNail">
												<img src="${reviewBoard.rb_content}" onerror="this.src='${pageContext.request.contextPath}/resources/images/noImage.png'" style="width : 280px; height : 250px;"/>
											</div>
											<strong class="thumbNailName2">${reviewBoard.rb_title}</strong>
											<p style="text-align: center;">${reviewBoard.m_nickname}</p>
										</a>
									</div>
								</div>
						</c:forEach>
					</article>
		 		<%-- <nav>${pagebar}</nav> --%>
			</section> 
		    </div>
		    </div>


<!-- ???????????? ?????? -->
	    	
	    	
<!-- ???????????? ?????? ?????? ?????? -->
	<hr><h1 id="tourism_title">?????? ?????? ??????</h1><hr>
		<div id="widgetMain">
				<table class="table table-bordered" id="searchTable" height="200px">
					<tbody>
						<tr>
							<th class="col" id="searchTh">??????</th>
							<td>
								<div class="finalName" id="areaCodeFinal"></div>
								<button type="button" class="btn btn-outline-dark" id="searchAreaBtn">????????????</button>
							</td>
						</tr>
						<tr>
							<th id="searchTh">????????????</th>
							<td id="searchTd">
								<div class="finalName" id="contentCodeFinal"></div>
								<button type="button" class="btn btn-outline-dark" id="searchContentBtn">??????????????????</button>
							</td>
						</tr>
						<tr id="serviceTr" style="display: none">
							<th id="searchTh">???????????????</th>
							<td id="searchTd">
								<div class="finalName" id="serviceCodeFinal"></div>
								<button type="button" class="btn btn-outline-dark" id="searchServiceBtn">????????? ?????? ??????</button>
							</td>
						</tr>
						<tr>
							<th id="searchTh">??????</th>
							<td>
								<button type="button" class="btn btn-outline-dark" id="searchDataBtn">??????</button>
							</td>
						</tr>
					</tbody>
				</table>
	
<!-- ???????????? ?????? ????????? ?????? -->
			<article id="contentArea">
				<div id="contentArea2" style="display: none">
					<div id="selectContent">
					</div>
					<div id="paging">
					</div>
					<br />
				</div>
			</article>
		</div>
	</div>
</div>
</div>  
<!-- ???????????? ?????? ???????????? -->
<script>

// ????????????
	var areaCode = 0;
	var areaName = 0;
	var sigunguCode = 0;
	var sigunguName = 0;
	var contentCode = 0;
	var contentName = 0;
	var cat1 = 0;
	var cat1Name = 0;
	var cat2 = 0;
	var cat2Name = 0;
	var cat3 = 0;
	var cat3Name = 0;
	var totalCount = 0;
	var pageStart = 0;
	var pageNo = "";
	var pagebar = "";
	

// ???????????? ??????
	document
			.querySelector('.createAreaModalForm')
			.addEventListener(
					'click',
					function(e) {
						if (e.target == document
								.querySelector('.createAreaModalForm')) {
							document.querySelector('.createAreaModalForm').classList
									.remove('show-modal');
						}
					});

// ???????????? ????????? ??????
	$('#searchAreaBtn').on('click', function() {
		
		$('.createAreaModalForm').addClass('show-modal');
		
		$.ajax({
			url : '${pageContext.request.contextPath}/widget/callArea.do',
			type : 'get',
			dataType : 'json',
			success : function(data) {

				var myItem = data.response.body.items.item;
				var areatitleLable = '<label for="title">?????????/???</label><br />';
				
				$('#areaList').empty();

				$('#areaList').append(areatitleLable);

				for (var i = 0; myItem.length > i; i++) {

					var output = '';
					output += '<button type="button" class="w-btn-outline w-btn-blue-outline" value="'
							+ myItem[i].code
							+ '" onClick="insertArea(this);">'
							+ myItem[i].name + '</button>';

					$('#areaList').append(output);
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status : " + textStatus);
				alert("Error : " + errorThrown);
			}
		});
	});
	
// ????????? ????????? ??????	
	function insertArea(arg0) {

		areaCode = $(arg0).val();
		areaName = $(arg0).html();

		$.ajax({
					url : '${pageContext.request.contextPath}/widget/callAreaCode.do',
					type : 'get',
					data : {
						areaCode : areaCode
					},
					dataType : 'json',
					success : function(data) {

						var myItem = data.response.body.items.item;
						var titleLable = '<label for="title">???/???/???</label><br />';
						sigunguCode = 0;
						sigunguCode += 0;
						
						$('#sigunguList').empty();

						$('#sigunguList').append(titleLable);

						for (var i = 0; myItem.length > i; i++) {

							var output = '';
							output += '<button type="button" class="w-btn-outline w-btn-blue-outline" value="'
									+ myItem[i].code
									+ '" onClick="insertSigungu(this);">'
									+ myItem[i].name + '</button>';

							$('#sigunguList').append(output);
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("Status : " + textStatus);
						alert("Error : " + errorThrown);
					}
				});
			};
			
// ???????????? ?????? ??????????????? ??????
	function insertSigungu(arg0) {
		sigunguCode = $(arg0).val();
		sigunguName = $(arg0).html();
	};

	$('#areaModalCloseBtn').on('click', function() {
		$('.createAreaModalForm').removeClass('show-modal');
	});

	$('#areaCancelBtn').on('click', function() {
		$('.createAreaModalForm').removeClass('show-modal');
	});
	
// ???????????? ?????? ????????????
	$('#areaConfirmBtn').on('click', function() {

		$('#areaCodeFinal').empty();

		var finalArea = '';
		
		if (sigunguCode != '0') {
			
			finalArea += '?????????/??? : ' + areaName + ', ???/???/??? : ' + sigunguName;
			$('.createAreaModalForm').removeClass('show-modal');
			$('#areaCodeFinal').append(finalArea);
			
		} else if (areaCode == '0') {
			
			alert('?????????/??? ??? ??????????????????.');
			
		} else {
			finalArea += '?????????/??? : ' + areaName 
			$('.createAreaModalForm').removeClass('show-modal');
			$('#areaCodeFinal').append(finalArea);
		}
	});

// ?????????????????? ??????
	document.querySelector('.createContentModalForm').addEventListener(
			'click',
			function(e) {
				if (e.target == document
						.querySelector('.createContentModalForm')) {
					document.querySelector('.createContentModalForm').classList
							.remove('show-modal');
				}
			});

// ?????????????????? ????????? ??????	
	$('#searchContentBtn').on('click', function() {
		
		$('.createContentModalForm').addClass('show-modal');
		
		$('#serviceTr').hide();
		$('#serviceCat1List').empty();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/widget/callCat1Code.do',
			type : 'get',
			dataType : 'json',
			success : function(data) {

				var myItem = data.response.body.items.item;
				var titleLable = '<label for="title">????????????</label><br />';

				$('#contentList').empty();

				$('#contentList').append(titleLable);

				for (var i = 0; myItem.length > i; i++) {

					var output = '';
					output += '<button type="button" class="w-btn-outline w-btn-blue-outline" value="'
							+ myItem[i].code
							+ '" onClick="insertContent(this);">'
							+ myItem[i].name + '</button>';

					$('#contentList').append(output);

				}
			},

			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status : " + textStatus);
				alert("Error : " + errorThrown);
			}
		});
	});
	
// ?????????????????? ?????? ??????????????? ??????
	function insertContent(arg0) {

		contentName = $(arg0).html();
		contentCode = $(arg0).val();

	};

	$('#contentModalCloseBtn').on('click', function() {
		$('.createContentModalForm').removeClass('show-modal');
	});

	$('#contentCancelBtn').on('click', function() {
		$('.createContentModalForm').removeClass('show-modal');
	});
	
// ?????????????????? ?????? ????????????
	$('#contentConfirmBtn').on('click', function() {

		$('#contentCodeFinal').empty();

		var finalContent = '';
		finalContent += '???????????? : ' + contentName;

		$('.createContentModalForm').removeClass('show-modal');
		$('#contentCodeFinal').append(finalContent);

		$('#serviceTr').show();
		
		var cat1 = '';
		cat1 += '<label for="title">' + '?????????' + '</label>' + '<br />'
		cat1 += '<button type="button" class="w-btn-outline w-btn-blue-outline" value="'; 
		cat1 += contentCode + '" onClick="insertCat1(this);">' + contentName + '</button>';
		
		$('#serviceCat1List').append(cat1);
		
	});

// ????????? ?????? ?????? ??????	
		document.querySelector('.createServiceModalForm').addEventListener(
			'click',
			function(e) {
				if (e.target == document
						.querySelector('.createServiceModalForm')) {
					document.querySelector('.createServiceModalForm').classList
							.remove('show-modal');
				}
			});
	
	$('#searchServiceBtn').on('click', function() {
		$('.createServiceModalForm').addClass('show-modal');
	});
	
// ????????? ?????? ?????? | ????????? ????????? ?????? (????????? = ??????????????????)
	function insertCat1(arg0) {
		
		cat1 = contentCode;
		cat1Name = contentName;
		
		$.ajax({
			url : '${pageContext.request.contextPath}/widget/callCat2Code.do',
			type : 'get',
			data : {
				cat1 : cat1
			},
			dataType : 'json',
			success : function(data) {

				var myItem = data.response.body.items.item;
				var titleLable = '<label for="title">?????????</label><br />';

				$('#serviceCat2List').empty();

				$('#serviceCat2List').append(titleLable);

				for (var i = 0; myItem.length > i; i++) {

					var output = '';
					output += '<button type="button" class="w-btn-outline w-btn-blue-outline" value="'
							+ myItem[i].code
							+ '" onClick="insertCat2(this);">'
							+ myItem[i].name + '</button>';

					$('#serviceCat2List').append(output);
				}
			},

			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status : " + textStatus);
				alert("Error : " + errorThrown);
			}
		});
	};
	
// ????????? ?????? ?????? | ????????? ????????? ??????	
	function insertCat2(arg0) {
		
		cat2 = $(arg0).val();
		cat2Name = $(arg0).html();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/widget/callCat3Code.do',
			type : 'get',
			data : {
				cat1 : cat1, 
				cat2 : cat2
			},
			dataType : 'json',
			success : function(data) {

				var myItem = data.response.body.items.item;
				var titleLable = '<label for="title">?????????</label><br />';

				$('#serviceCat3List').empty();

				$('#serviceCat3List').append(titleLable);

				for (var i = 0; myItem.length > i; i++) {

					var output = '';
					output += '<button type="button" class="w-btn-outline w-btn-blue-outline" value="'
							+ myItem[i].code
							+ '" onClick="insertCat3(this);">'
							+ myItem[i].name + '</button>';

					$('#serviceCat3List').append(output);

				}
			},

			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status : " + textStatus);
				alert("Error : " + errorThrown);
			}
		});
	};
	
// ????????? ?????? ?????? ?????? ??????????????? ??????	
	function insertCat3(arg0){
		cat3 = $(arg0).val();
		cat3Name = $(arg0).html();
	}
	
	$('#serviceModalCloseBtn').on('click', function() {
		$('.serviceContentModalForm').removeClass('show-modal');
	});

	$('#serviceCancelBtn').on('click', function() {
		$('.serviceContentModalForm').removeClass('show-modal');
	});
	
// ????????? ?????? ?????? ?????? ????????????
	$('#serviceConfirmBtn').on('click', function() {
		
		$('#serviceCodeFinal').empty();

		if (cat2 == '0') {
			finalService += '????????? : ' + cat1Name;
		} else if (cat2 != '0' && cat3 == '0') {
			finalService += '????????? : ' + cat1Name + '????????? : ' + cat2Name;
		} else {
			finalService += '????????? : ' + cat1Name + '????????? : ' + cat2Name + '????????? : ' + cat3Name;
		}
		
		$('.createServiceModalForm').removeClass('show-modal');
		$('#ServiceCodeFinal').append(finalService);
	});
	
// ?????? ??????
	$('#searchDataBtn').on('click', function() {
		
		$('#contentArea2').show();
		
// ????????? ?????? ???????????? ??? ?????? ??????
		$.ajax({
			url : '${pageContext.request.contextPath}/widget/callAreaBasedListlength.do',
			type : 'get',
			data : {
				
				areaCode : areaCode,
				sigunguCode : sigunguCode,
				// cat1 : cat1, - ???, ???, ??? ?????? ?????? api????????? ????????? ????????????
				// cat2 : cat2,
				// cat3 : cat3
				
			},
			
			dataType : 'json',
			success : function(data) {

				var myItem = data.response.body.items.item;
				for (var i = 0; myItem.length > i; i++) {
						totalCount = myItem[i].totalCnt;
				};

//????????? ?????? ????????? ????????? ?????? 
				$.ajax({
					url : '${pageContext.request.contextPath}/widget/callAreaBasedList.do',
					type : 'get',
					data : {
						
						areaCode : areaCode,
						sigunguCode : sigunguCode,
						totalCount : totalCount
						// cat1 : cat1,
						// cat2 : cat2,
						// cat3 : cat3
						
					},
					
					dataType : 'json',
					success : function(data) {
						
						var cPage = data.CPage;
						var numPerPage = data.numPerPage;
						var totalcontent = data.totalContent;
						var totalContent = parseFloat(totalcontent);
						var url = data.url;
						var myItem = data.items;
						
						$('#selectContent').empty();
						$('#paging').empty();

		// ????????? ????????? ????????? ??????
						for(var i = 0; myItem.length > i; i++){
							
							if(myItem[i].firstimage2 == ""){
								myItem[i].firstimage2 = '${pageContext.request.contextPath}/resources/images/noImage.png';
							};
							
							var gallery = "";
							gallery += '<a href="${pageContext.request.contextPath}/tourism/?'+ myItem[i].contentid +'":" class="thumbNailLink" id="' + myItem[i].contentid + '" >';
							gallery += '<span class="thumbNailImage">';
							gallery += '<img src="' + myItem[i].firstimage2 +'" width="300" height="200" />';
							gallery += '</span>';
							gallery += '<strong class="thumbNailName">' + myItem[i].title + '</strong>';
							gallery += '</a>';
							
							$('#selectContent').append(gallery);
						};
		// ???????????? ??????
							pagebar = "";
							pageNo = "";
							pageStart = "";
							var pagebarsize = '5';
							var pagebarSize = parseInt(pagebarsize);
							url += '?cPage=';
							var totalPage = parseInt(Math.ceil(totalContent / numPerPage));
							pageStart = parseInt(((cPage - 1) / pagebarSize) * pagebarsize + 1);
							var pageEnd = parseInt(pageStart + pagebarSize - 1);
							pageNo = pageStart;
							var previous = "";
							var main = "";
							var next = "";
							
		// ???????????? ?????? ??????
							if(pageNo == 1) {
								previous += '<li class=\"page-item disabled\"><a class=\"page-link\" href="javascript:void(0)" onclick="callPreviousList(this)" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
								}
							else {
								previous += '<li class=\"page-item\"><a class=\"page-link\" href="javascript:void(0)" onclick="callPreviousList(this)" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
								}
							
		// ???????????? ?????? ??????
							while(pageNo <= pageEnd && pageNo <= totalPage) {
								if(pageNo == cPage) {
									main += '<li class=\"page-item active\"><span class=\"page-link\">' + pageNo + '<span class=\"sr-only\">(current)</span></span></li>'
									}
								else {
									main +='<li class=\"page-item\"><a class=\"page-link\" id = "pagingMain" value="' + pageNo + '" href="javascript:void(0)" onclick="callMainList(this)">' + pageNo + '</a></li>'
									}
								pageNo++;
								}
							
		// ???????????? ?????? ??????
							if(pageNo > totalPage){
								next += '<li class=\"page-item disabled\"><a class=\"page-link\" href="javascript:void(0)" onclick="callNextList(this)" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span> <span class=\"sr-only\">Next</span></a></li>'
								}
							else{
								next += '<li class=\"page-item\"><a class=\"page-link\" href="javascript:void(0)" onclick="callNextList(this)" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span><span class=\"sr-only\">Next</span></a></li></ul>'
								}
								
							pagebar += '<nav id="pagebar">';
							pagebar += '<ul class=\"pagination  justify-content-center pagination-sm\">\r\n';
							pagebar += previous;
							pagebar += main;
							pagebar += next;
							$('#paging').append(pagebar);
							
					},
					
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("Status : " + textStatus);
						alert("Error : " + errorThrown);
					}
				});
			},
			error : function(XMLHttpRequest, textStatus, errorThrown, data) {
				alert("Status : " + textStatus);
				alert("Error : " + errorThrown);
			}
		});
	});
	
// ???????????? ?????? ?????? ?????????, ????????? ????????? ??????
	function callPreviousList(arg0){
		
		$.ajax({
			url : '${pageContext.request.contextPath}/widget/callPreviousList.do',
			type : 'get',
			data : {
				
				pageStart : pageStart,
				areaCode : areaCode,
				sigunguCode : sigunguCode,
				totalCount : totalCount
				// cat1 : cat1,
				// cat2 : cat2,
				// cat3 : cat3
				
			},
			
			dataType : 'json',
			success : function(data) {
				
				var cPage = data.CPage;
				var numPerPage = data.numPerPage;
				var totalcontent = data.totalContent;
				var totalContent = parseFloat(totalcontent);
				var url = data.url;
				var myItem = data.items;
				
				$('#selectContent').empty();
				$('#paging').empty();
		
				for(var i = 0; myItem.length > i; i++){
					
					if(myItem[i].firstimage2 == ""){
						myItem[i].firstimage2 = '${pageContext.request.contextPath}/resources/images/noImage.png';
					};
					
					var gallery = "";
					gallery += '<a href="${pageContext.request.contextPath}/tourism/?'+ myItem[i].contentid +'":" class="thumbNailLink" id="' + myItem[i].contentid + '" >';
					gallery += '<span class="thumbNailImage">';
					gallery += '<img src="' + myItem[i].firstimage2 +'" width="300" height="200" />';
					gallery += '</span>';
					gallery += '<strong class="thumbNailName">' + myItem[i].title + '</strong>';
					gallery += '</a>';
					
					$('#selectContent').append(gallery);
				};
				
					pagebar = "";
					pageNo = "";
					pageStart = "";
					var pagebarsize = '5';
					var pagebarSize = parseInt(pagebarsize);
					url += '?cPage=';
					var totalPage = parseInt(Math.ceil(totalContent / numPerPage));
					pageStart = parseInt(((cPage - 1) / pagebarSize) * pagebarsize + 1);
					var pageEnd = parseInt(pageStart + pagebarSize - 1);
					pageNo = pageStart;
					var previous = "";
					var main = "";
					var next = "";
					
					if(pageNo == 1) {
						previous += '<li class=\"page-item\"><a class=\"page-link\" href="javascript:void(0)" onclick=\"callPreviousList(this)\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
						}
					else {
						previous += '<li class=\"page-item disabled\"><a class=\"page-link\" href="javascript:void(0)" onclick=\"callPreviousList(this)\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
						}
					
					while(pageNo <= pageEnd && pageNo <= totalPage) {
						if(pageNo == cPage) {
							main += '<li class=\"page-item active\"><span class=\"page-link\">' + pageNo + '<span class=\"sr-only\">(current)</span></span></li>'
							}
						else {
							main +='<li class=\"page-item\"><a class=\"page-link\" id ="pagingMain"  href="javascript:void(0)" onclick=\"callMainList(this);\">' + pageNo + '</a></li>'
							}
						pageNo++;
						}
					
					if(pageNo > totalPage){
						next += '<li class=\"page-item\"><a class=\"page-link\" href="javascript:void(0)" onclick="callNextList(this)" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span> <span class=\"sr-only\">Next</span></a></li>'
						}
					else{
						next += '<li class=\"page-item disabled\"><a class=\"page-link\" href="javascript:void(0)" onclick="callNextList(this)" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span><span class=\"sr-only\">Next</span></a></li></ul>'
						}
						
					pagebar += '<nav id="pagebar">';
					pagebar += '<ul class=\"pagination  justify-content-center pagination-sm\">\r\n';
					pagebar += previous;
					pagebar += main;
					pagebar += next;
					$('#paging').append(pagebar);
				
			},
			
			error : function(XMLHttpRequest, textStatus, errorThrown, data) {
				alert("Status : " + textStatus);
				alert("Error : " + errorThrown);
			}
	});
		
	};

// ???????????? ???????????? ?????????, ????????? ????????? ??????
	function callMainList(arg0){
		
		var mainPageNo = $(arg0).text();
		var start = pageStart;
		
		$.ajax({
			url : '${pageContext.request.contextPath}/widget/callMainList.do',
			type : 'get',
			data : {
				
				mainPageNo : mainPageNo,
				areaCode : areaCode,
				sigunguCode : sigunguCode,
				totalCount : totalCount
				// cat1 : cat1,
				// cat2 : cat2,
				// cat3 : cat3
				
			},
			
			dataType : 'json',
			success : function(data) {
				
				var cPage = data.CPage;
				var numPerPage = data.numPerPage;
				var totalcontent = data.totalContent;
				var totalContent = parseFloat(totalcontent);
				var url = data.url;
				var myItem = data.items;
				
				$('#selectContent').empty();
				$('#paging').empty();
		
				for(var i = 0; myItem.length > i; i++){
					
					if(myItem[i].firstimage2 == ""){
						myItem[i].firstimage2 = '${pageContext.request.contextPath}/resources/images/noImage.png';
					};
					
					var gallery = "";
					gallery += '<a href="${pageContext.request.contextPath}/tourism/?'+ myItem[i].contentid +'":" class="thumbNailLink" id="' + myItem[i].contentid + '" >';
					gallery += '<span class="thumbNailImage">';
					gallery += '<img src="' + myItem[i].firstimage2 +'" width="300" height="200" />';
					gallery += '</span>';
					gallery += '<strong class="thumbNailName">' + myItem[i].title + '</strong>';
					gallery += '</a>';
					
					$('#selectContent').append(gallery);
				};
				
					pagebar = "";
					pageNo = "";
					pageStart = "";
					var pagebarsize = '5';
					var pagebarSize = parseInt(pagebarsize);
					var totalPage = parseInt(Math.ceil(totalContent / numPerPage));
					pageStart = start;
					var pageEnd = parseInt(pageStart + pagebarSize - 1);
					pageNo = pageStart;
					var previous = "";
					var main = "";
					var next = "";
					
					if(pageNo == 1) {
						previous += '<li class=\"page-item disabled\"><a class=\"page-link\" href="javascript:void(0)" onclick="callPreviousList(this)" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
						}
					else {
						previous += '<li class=\"page-item\"><a class=\"page-link\" href="javascript:void(0)" onclick="callPreviousList(this)" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
						}
					
					while(pageNo <= pageEnd && pageNo <= totalPage) {
						if(pageNo == cPage) {
							main += '<li class=\"page-item active\"><span class=\"page-link\">' + pageNo + '<span class=\"sr-only\">(current)</span></span></li>'
							}
						else {
							main +='<li class=\"page-item\"><a class=\"page-link\" id = "pagingMain" href="javascript:void(0)" onclick="callMainList(this)">' + pageNo + '</a></li>'
							}
						pageNo++;
						}

					if(pageNo > totalPage){
						next += '<li class=\"page-item disabled\"><a class=\"page-link\" href="javascript:void(0)" onclick="callNextList(this)" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span> <span class=\"sr-only\">Next</span></a></li>'
						}
					else{
						next += '<li class=\"page-item\"><a class=\"page-link\" href="javascript:void(0)" onclick="callNextList(this)" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span><span class=\"sr-only\">Next</span></a></li></ul>'
						}
						
					pagebar += '<nav id="pagebar">';
					pagebar += '<ul class=\"pagination  justify-content-center pagination-sm\">\r\n';
					pagebar += previous;
					pagebar += main;
					pagebar += next;
					$('#paging').append(pagebar);
				
			},
			
			error : function(XMLHttpRequest, textStatus, errorThrown, data) {
				alert("Status : " + textStatus);
				alert("Error : " + errorThrown);
			}
	});
	};
		
// ???????????? ???????????? ?????????, ????????? ????????? ??????	
	function callNextList(arg0){
		
		$.ajax({
			url : '${pageContext.request.contextPath}/widget/callNextList.do',
			type : 'get',
			data : {
				
				pageStart  : pageStart,
				areaCode : areaCode,
				sigunguCode : sigunguCode,
				totalCount : totalCount
				// cat1 : cat1,
				// cat2 : cat2,
				// cat3 : cat3
				
			},
			
			dataType : 'json',
			success : function(data) {
				
				var cPage = data.CPage;
				var numPerPage = data.numPerPage;
				var totalcontent = data.totalContent;
				var totalContent = parseFloat(totalcontent);
				var url = data.url;
				var myItem = data.items;
				
				$('#selectContent').empty();
				$('#paging').empty();
		
				for(var i = 0; myItem.length > i; i++){
					
					if(myItem[i].firstimage2 == ""){
						myItem[i].firstimage2 = '${pageContext.request.contextPath}/resources/images/noImage.png';
					};
					
					var gallery = "";
					gallery += '<a href="${pageContext.request.contextPath}/tourism/?'+ myItem[i].contentid +'":" class="thumbNailLink" id="' + myItem[i].contentid + '" >';
					gallery += '<span class="thumbNailImage">';
					gallery += '<img src="' + myItem[i].firstimage2 +'" width="300" height="200" />';
					gallery += '</span>';
					gallery += '<strong class="thumbNailName">' + myItem[i].title + '</strong>';
					gallery += '</a>';
					
					$('#selectContent').append(gallery);
				};
				
					pagebar = "";
					pageNo = "";
					pageStart = "";
					var pagebarsize = '5';
					var pagebarSize = parseInt(pagebarsize);
					url += '?cPage=';
					var totalPage = parseInt(Math.ceil(totalContent / numPerPage));
					pageStart = parseInt(((cPage - 1) / pagebarSize) * pagebarsize + 1);
					var pageEnd = parseInt(pageStart + pagebarSize - 1);
					pageNo = pageStart;
					var previous = "";
					var main = "";
					var next = "";
					
					if(pageNo == 1) {
						previous += '<li class=\"page-item disabled\"><a class=\"page-link\" href="javascript:void(0)" onclick="callPreviousList(this)" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
						}
					else {
						previous += '<li class=\"page-item\"><a class=\"page-link\" href="javascript:void(0)" onclick="callPreviousList(this)" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
						}
					
					while(pageNo <= pageEnd && pageNo <= totalPage) {
						if(pageNo == cPage) {
							main += '<li class=\"page-item active\"><span class=\"page-link\">' + pageNo + '<span class=\"sr-only\">(current)</span></span></li>'
							}
						else {
							main +='<li class=\"page-item\"><a class=\"page-link\" id = "pagingMain" href="javascript:void(0)" onclick="callMainList(this)">' + pageNo + '</a></li>'
							}
						pageNo++;
						}
					
					// next
					if(pageNo > totalPage){
						next += '<li class=\"page-item disabled\"><a class=\"page-link\" href="javascript:void(0)" onclick="callNextList(this)" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span> <span class=\"sr-only\">Next</span></a></li>'
						}
					else{
						next += '<li class=\"page-item\"><a class=\"page-link\" href="javascript:void(0)" onclick="callNextList(this)" aria-label=\"Next\"><span aria-hidden=\"true\">&raquo;</span><span class=\"sr-only\">Next</span></a></li></ul>'
						}
						
					pagebar += '<nav id="pagebar">';
					pagebar += '<ul class=\"pagination  justify-content-center pagination-sm\">\r\n';
					pagebar += previous;
					pagebar += main;
					pagebar += next;
					$('#paging').append(pagebar);
				
			},
			
			error : function(XMLHttpRequest, textStatus, errorThrown, data) {
				alert("Status : " + textStatus);
				alert("Error : " + errorThrown);
			}
	});
	};
	
</script>
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>