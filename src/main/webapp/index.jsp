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
	height: 500px;
	margin: auto;
	overflow: hidden;
}

#bestReview {
	width: 100%;
	height: 500px;
	margin: auto;
	overflow: hidden;
}

tr[data-no] {
	cursor: pointer;
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

#contentArea2 {
	width: 280px;
	height: 330px;
	margin: auto;
	overflow: hidden;
	display: inline-block;
}


</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tourism.css">
    <div id="video_area">
        <video src="${pageContext.request.contextPath}/resources/video/mainPage.mp4" id="background_video" auto autoplay loop muted volume="0"></video>
    </div>
    
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="Travel Making Imagine" name="title" />
</jsp:include>
<div id="mainpage_wrap">
	<div id="mainpage_content">
	
<!-- 
    생성 : 김용민, 최윤서, 전인찬, 이경석
    작업 : 김용민, 최윤서, 전인찬, 이경석
 -->

  
 <!-- 
 
 	관광정보 위젯 모달
 
  -->
 
		 		<div class="createAreaModalForm">
			<div class="modal-dialog-centered modal-dialog-scrollable"
		id="createAreaModal">
				<div class="modal-content">
					<div class="modal-header">
						<h1>지역</h1>
						<button type="button" class="btn-close" id="areaModalCloseBtn"
							data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="modalInfo" id="areaList">
						</div>

						<div class="modalInfo" id="sigunguList"></div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="areaConfirmBtn">확인</button>
						<button type="button" class="btn btn-secondary" id="areaCancelBtn"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="createContentModalForm">
			<div class="modal-dialog-centered modal-dialog-scrollable"
				id="createContentModal">
				<div class="modal-content">
					<div class="modal-header">
						<h1>관광타입</h1>
						<button type="button" class="btn-close" id="contentModalCloseBtn"
							data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="modalInfo" id="contentList">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="contentConfirmBtn">확인</button>
						<button type="button" class="btn btn-secondary"
							id="contentCancelBtn" data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="createServiceModalForm">
			<div class="modal-dialog-centered modal-dialog-scrollable"
				id="createServiceModal">
				<div class="modal-content">
					<div class="modal-header">
						<h1>서비스 분류 선택</h1>
						<button type="button" class="btn-close" id="serviceModalCloseBtn"
							data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="modalInfo" id="serviceCat1List">
							
						</div>
						<div class="modalInfo" id="serviceCat2List">
						</div>
						<div class="modalInfo" id="serviceCat3List">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="serviceConfirmBtn">확인</button>
						<button type="button" class="btn btn-secondary" id="serviceCancelBtn"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	 
	 
	 
	    <div style="width:auto; height:100vh; display:flex; margin:auto 0;"></div>
	    
	    <!-- 
	    	관광정보 위젯 파트
	     -->
	     
        <div id="bestPlanner">
	 	
	 		</div>
	        <div id="bestReview">
	 			<h1>베스트 후기</h1>
	 			<section id="board-container" class="container">
					<article>
						<c:forEach items="${list4}" var="reviewBoard" varStatus="vs">
								<div id="contentArea2">
								
									<div id="selectContent">
										<a href="${pageContext.request.contextPath}/board/review/reviewBoardDetail.do?no=${reviewBoard.rb_no}">
											<span class="thumbNailImage">
												<img src="${reviewBoard.rb_content}" onerror="this.src='${pageContext.request.contextPath}/resources/images/noImage.png'"/>
											</span>
											<strong class="thumbNailName">
												${reviewBoard.rb_title}
											</strong>
										</a>
									</div>
								</div>
						</c:forEach>
					</article>
		 		<%-- <nav>${pagebar}</nav> --%>
			</section> 
		    </div>
	    
	    	<!-- 관광정보 CSS 작업폼 시작(안에 폼 사용하면 됩니당.)-->
	    	<div id="commonMain2">
	    	
	        <hr><h1 id="tourism_title">관광 정보</h1><hr>

	        <div id="area">
	            <button class="w-btn-outline w-btn-blue-outline" type="button">
	                서울
	            </button>
	            <button class="w-btn-outline w-btn-blue-outline" type="button">
	                인천
	            </button>
	        </div>
	        <div id="tourism_type">
	            <button class="w-btn-outline w-btn-blue-outline" type="button">
	                전체
	            </button>
	            <button class="w-btn-outline w-btn-blue-outline" type="button">
	                관광지(자연)
	            </button>
	        </div>
			<!-- 관광정보 CSS 작업폼 끝-->
	    	
	    	
	    	<div id="searchTable">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th class="col" id="searchTh">지역</th>
						<td>
							<div class="finalName" id="areaCodeFinal"></div>
							<button type="button" class="btn btn-info" id="searchAreaBtn">지역선택</button>
						</td>
					</tr>
					<tr>
						<th id="searchTh">관광타입</th>
						<td id="searchTd">
							<div class="finalName" id="contentCodeFinal"></div>
							<button type="button" class="btn btn-info" id="searchContentBtn">관광타입선택</button>
						</td>
					</tr>
					<tr id="serviceTr" style="display: none">
						<th id="searchTh">서비스분류</th>
						<td id="searchTd">
							<div class="finalName" id="serviceCodeFinal"></div>
							<button type="button" class="btn btn-info" id="searchServiceBtn">서비스 분류 선택</button>
						</td>
					</tr>
					<tr>
						<th id="searchTh">검색</th>
						<td>
							<button type="button" class="btn btn-info" id="searchDataBtn">검색</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	
		<article id="contentArea">
			<div id="contentArea2" style="display: none">
				<div id="selectContent">
				</div>
				<div id="paging">
				</div>
			</div>
		</article>
	    </div>
    </div>
</div>
    
    <!-- 
    
    	관광정보 위젯 스크립트
    
     -->
    
<script>

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
	

	// areaModal

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

	$('#searchAreaBtn').on('click', function() {
		$('.createAreaModalForm').addClass('show-modal');
		
		$.ajax({
			url : '${pageContext.request.contextPath}/widget/callArea.do',
			type : 'get',
			dataType : 'json',
			success : function(data) {

				var myItem = data.response.body.items.item;
				var areatitleLable = '<label for="title">광역시/도</label><br />';
				
				$('#areaList').empty();

				$('#areaList').append(areatitleLable);

				for (var i = 0; myItem.length > i; i++) {

					var output = '';
					output += '<button type="button" class="btn btn-light" value="'
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

	function insertArea(arg0) {

		areaCode = $(arg0).val();
		areaName = $(arg0).html();
		console.log('areaCode = ' + areaCode);
		console.log('areaName = ' + areaName);

		$.ajax({
					url : '${pageContext.request.contextPath}/widget/callAreaCode.do',
					type : 'get',
					data : {
						areaCode : areaCode
					},
					dataType : 'json',
					success : function(data) {

						var myItem = data.response.body.items.item;
						var titleLable = '<label for="title">시/군/구</label><br />';
						sigunguCode = 0;
						sigunguCode += 0;
						
						$('#sigunguList').empty();

						$('#sigunguList').append(titleLable);

						for (var i = 0; myItem.length > i; i++) {

							var output = '';
							output += '<button type="button" class="btn btn-light" value="'
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

	function insertSigungu(arg0) {

		sigunguCode = $(arg0).val();
		console.log('sigunguCode = ' + sigunguCode);
		sigunguName = $(arg0).html();
		console.log('sigunguName = ' + sigunguName);

	};

	$('#areaModalCloseBtn').on('click', function() {
		$('.createAreaModalForm').removeClass('show-modal');
	});

	$('#areaCancelBtn').on('click', function() {
		$('.createAreaModalForm').removeClass('show-modal');
	});

	$('#areaConfirmBtn').on('click', function() {

		$('#areaCodeFinal').empty();

		var finalArea = '';
		
		if (sigunguCode != '0') {
			
			finalArea += '광역시/도 : ' + areaName + ', 시/군/구 : ' + sigunguName;
			console.log('finalArea = ' + finalArea);
			$('.createAreaModalForm').removeClass('show-modal');
			$('#areaCodeFinal').append(finalArea);
			
		} else if (areaCode == '0') {
			
			alert('광역시/도 를 선택하십시요.');
			
		} else {
			finalArea += '광역시/도 : ' + areaName 
			console.log('finalArea = ' + finalArea);
			$('.createAreaModalForm').removeClass('show-modal');
			$('#areaCodeFinal').append(finalArea);
		}
	});

	// contentModal

	document.querySelector('.createContentModalForm').addEventListener(
			'click',
			function(e) {
				if (e.target == document
						.querySelector('.createContentModalForm')) {
					document.querySelector('.createContentModalForm').classList
							.remove('show-modal');
				}
			});

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
				var titleLable = '<label for="title">관광타입</label><br />';

				$('#contentList').empty();

				$('#contentList').append(titleLable);

				for (var i = 0; myItem.length > i; i++) {

					var output = '';
					output += '<button type="button" class="btn btn-light" value="'
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

	function insertContent(arg0) {

		contentName = $(arg0).html();
		console.log('contentName = ' + contentName);
		contentCode = $(arg0).val();
		console.log('contentCode = ' + contentCode);

	};

	$('#contentModalCloseBtn').on('click', function() {
		$('.createContentModalForm').removeClass('show-modal');
	});

	$('#contentCancelBtn').on('click', function() {
		$('.createContentModalForm').removeClass('show-modal');
	});

	$('#contentConfirmBtn').on('click', function() {

		$('#contentCodeFinal').empty();

		var finalContent = '';
		finalContent += '관광타입 : ' + contentName;
		console.log('finalContent = ' + finalContent);

		$('.createContentModalForm').removeClass('show-modal');
		$('#contentCodeFinal').append(finalContent);

		$('#serviceTr').show();
		
		var cat1 = '';
		cat1 += '<label for="title">' + '대분류' + '</label>' + '<br />'
		cat1 += '<button type="button" class="btn btn-light" value="' + contentCode + '" onClick="insertCat1(this);">' + contentName + '</button>';
		
		$('#serviceCat1List').append(cat1);
		
	});

	// serviceModal
	
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

	function insertCat1(arg0) {
		
		cat1 = contentCode;
		cat1Name = contentName;
		
		console.log('cat1 = ' + cat1);
		console.log('cat1Name = ' + cat1Name);
		
		$.ajax({
			url : '${pageContext.request.contextPath}/widget/callCat2Code.do',
			type : 'get',
			data : {
				cat1 : cat1
			},
			dataType : 'json',
			success : function(data) {

				var myItem = data.response.body.items.item;
				var titleLable = '<label for="title">중분류</label><br />';

				$('#serviceCat2List').empty();

				$('#serviceCat2List').append(titleLable);

				for (var i = 0; myItem.length > i; i++) {

					var output = '';
					output += '<button type="button" class="btn btn-light" value="'
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
	
	function insertCat2(arg0) {
		
		cat2 = $(arg0).val();
		cat2Name = $(arg0).html();
		
		console.log('cat1 = ' + cat1);
		console.log('cat2 = ' + cat2);
		console.log('cat2Name = ' + cat2Name);
		
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
				var titleLable = '<label for="title">소분류</label><br />';

				$('#serviceCat3List').empty();

				$('#serviceCat3List').append(titleLable);

				for (var i = 0; myItem.length > i; i++) {

					var output = '';
					output += '<button type="button" class="btn btn-light" value="'
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
	
	function insertCat3(arg0){
		
		cat3 = $(arg0).val();
		cat3Name = $(arg0).html();
		console.log('cat3 = ' + cat3);
		console.log('cat3Name = ' + cat3Name);
		
	}
	
	$('#serviceModalCloseBtn').on('click', function() {
		$('.serviceContentModalForm').removeClass('show-modal');
	});

	$('#serviceCancelBtn').on('click', function() {
		$('.serviceContentModalForm').removeClass('show-modal');
	});

	$('#serviceConfirmBtn').on('click', function() {
		
		$('#serviceCodeFinal').empty();

		if (cat2 == '0') {
			finalService += '대분류 : ' + cat1Name;
			console.log('finalService = ' + finalService);
		} else if (cat2 != '0' && cat3 == '0') {
			finalService += '대분류 : ' + cat1Name + '중분류 : ' + cat2Name;
			console.log('finalService = ' + finalService);
		} else {
			finalService += '대분류 : ' + cat1Name + '중분류 : ' + cat2Name + '소분류 : ' + cat3Name;
			console.log('finalService = ' + finalService);
		}
		
		$('.createServiceModalForm').removeClass('show-modal');
		$('#ServiceCodeFinal').append(finalService);
	});
	
	// search

	$('#searchDataBtn').on('click', function() {
		
		console.log('areaCode = ' + areaCode);
		console.log('sigunguCode = ' + sigunguCode);
		console.log('cat1 = ' + cat1);
		console.log('cat2 = ' + cat2);
		console.log('cat3 = ' + cat3);
		console.log("검색 실행");
		
		$('#contentArea2').show();
		
		$.ajax({
			url : '${pageContext.request.contextPath}/widget/callAreaBasedListlength.do',
			type : 'get',
			data : {
				
				areaCode : areaCode,
				sigunguCode : sigunguCode,
				// cat1 : cat1,
				// cat2 : cat2,
				// cat3 : cat3
				
			},
			
			dataType : 'json',
			success : function(data) {

				var myItem = data.response.body.items.item;
				console.log(myItem);
				console.log("1차 ajax 성공");
				for (var i = 0; myItem.length > i; i++) {
						totalCount = myItem[i].totalCnt;
				};
				console.log("totalCount = " + totalCount);
				
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
						
						
						console.log(data);
						console.log("Cpage = " + data.CPage);
						console.log("totalContent = " + data.totalContent);
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
							gallery += '<a href="\${pageContext.request.contextPath}/tourism/?'+ myItem[i].contentid +'":" class="thumbNailLink" id="' + myItem[i].contentid + '" >';
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
							
							console.log("pagebarSize = " + pagebarSize);
							console.log("totalPage = " + totalPage);
							console.log("pageStart = " + pageStart);
							console.log("pageEnd = " + pageEnd);
							console.log("pageNo = " + pageNo);
							console.log("previous = " + previous);
							console.log("next = " + next);
							
							// previous
							if(pageNo == 1) {
								previous += '<li class=\"page-item disabled\"><a class=\"page-link\" href="javascript:void(0)" onclick="callPreviousList(this)" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
								}
							else {
								previous += '<li class=\"page-item\"><a class=\"page-link\" href="javascript:void(0)" onclick="callPreviousList(this)" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
								}
							
							// pagingbar main
							while(pageNo <= pageEnd && pageNo <= totalPage) {
								if(pageNo == cPage) {
									main += '<li class=\"page-item active\"><span class=\"page-link\">' + pageNo + '<span class=\"sr-only\">(current)</span></span></li>'
									}
								else {
									main +='<li class=\"page-item\"><a class=\"page-link\" id = "pagingMain" value="' + pageNo + '" href="javascript:void(0)" onclick="callMainList(this)">' + pageNo + '</a></li>'
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
					
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("Status : " + textStatus);
						alert("Error : " + errorThrown);
					}
					
				});
				
					
			},

			error : function(XMLHttpRequest, textStatus, errorThrown, data) {
				alert("Status : " + textStatus);
				alert("Error : " + errorThrown);
				console.log("data = " + data);
			}

		});

	});
	
	function callPreviousList(arg0){
		
		console.log("pageStart = " + pageStart);
		
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
				
				console.log(data);
				console.log("Cpage = " + data.CPage);
				console.log("totalContent = " + data.totalContent);
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
					gallery += '<a href="\${pageContext.request.contextPath}/tourism/?'+ myItem[i].contentid +'":" class="thumbNailLink" id="' + myItem[i].contentid + '" >';
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
					
					console.log("pagebarSize = " + pagebarSize);
					console.log("totalPage = " + totalPage);
					console.log("pageStart = " + pageStart);
					console.log("pageEnd = " + pageEnd);
					console.log("pageNo = " + pageNo);
					console.log("previous = " + previous);
					console.log("next = " + next);
					
					// previous
					if(pageNo == 1) {
						previous += '<li class=\"page-item\"><a class=\"page-link\" href="javascript:void(0)" onclick=\"callPreviousList(this)\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
						}
					else {
						previous += '<li class=\"page-item disabled\"><a class=\"page-link\" href="javascript:void(0)" onclick=\"callPreviousList(this)\" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
						}
					
					// pagingbar main
					while(pageNo <= pageEnd && pageNo <= totalPage) {
						if(pageNo == cPage) {
							main += '<li class=\"page-item active\"><span class=\"page-link\">' + pageNo + '<span class=\"sr-only\">(current)</span></span></li>'
							}
						else {
							main +='<li class=\"page-item\"><a class=\"page-link\" id ="pagingMain"  href="javascript:void(0)" onclick=\"callMainList(this);\">' + pageNo + '</a></li>'
							}
						pageNo++;
						}
					
					// next
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
				console.log("data = " + data);
			}
	});
		
	};

	function callMainList(arg0){
		
		var mainPageNo = $(arg0).text();
		console.log("mainPageNo = " + mainPageNo);
		console.log("pageStart = " + pageStart);
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
				
				console.log(data);
				console.log("Cpage = " + data.CPage);
				console.log("totalContent = " + data.totalContent);
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
					gallery += '<a href="\${pageContext.request.contextPath}/tourism/?'+ myItem[i].contentid +'":" class="thumbNailLink" id="' + myItem[i].contentid + '" >';
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
					
					console.log("pagebarSize = " + pagebarSize);
					console.log("totalPage = " + totalPage);
					console.log("pageStart = " + pageStart);
					console.log("pageEnd = " + pageEnd);
					console.log("pageNo = " + pageNo);
					console.log("previous = " + previous);
					console.log("next = " + next);
					
					// previous
					if(pageNo == 1) {
						previous += '<li class=\"page-item disabled\"><a class=\"page-link\" href="javascript:void(0)" onclick="callPreviousList(this)" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
						}
					else {
						previous += '<li class=\"page-item\"><a class=\"page-link\" href="javascript:void(0)" onclick="callPreviousList(this)" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
						}
					
					// pagingbar main
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
				console.log("data = " + data);
			}
	});
		
	};
		
	
	function callNextList(arg0){
		
		console.log("pageStart = " + pageStart);
		
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
				
				console.log(data);
				console.log("Cpage = " + data.CPage);
				console.log("totalContent = " + data.totalContent);
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
					gallery += '<a href="\${pageContext.request.contextPath}/tourism/?'+ myItem[i].contentid +'":" class="thumbNailLink" id="' + myItem[i].contentid + '" >';
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
					
					console.log("pagebarSize = " + pagebarSize);
					console.log("totalPage = " + totalPage);
					console.log("pageStart = " + pageStart);
					console.log("pageEnd = " + pageEnd);
					console.log("pageNo = " + pageNo);
					console.log("previous = " + previous);
					console.log("next = " + next);
					
					// previous
					if(pageNo == 1) {
						previous += '<li class=\"page-item disabled\"><a class=\"page-link\" href="javascript:void(0)" onclick="callPreviousList(this)" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
						}
					else {
						previous += '<li class=\"page-item\"><a class=\"page-link\" href="javascript:void(0)" onclick="callPreviousList(this)" aria-label=\"Previous\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>'
						}
					
					// pagingbar main
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
				console.log("data = " + data);
			}
	});
		
	};
	
</script>
    

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>