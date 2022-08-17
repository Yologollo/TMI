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

<!-- 
	생성 : 전인찬
	작업 : 전인찬
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
					<label for="title">광역시/도</label><br />
					<button type="button" class="btn btn-light" value="1"
						onClick="insertArea(this);">서울</button>
					<button type="button" class="btn btn-light" value="2"
						onClick="insertArea(this);">인천</button>
					<button type="button" class="btn btn-light" value="3"
						onClick="insertArea(this);">대전</button>
					<button type="button" class="btn btn-light" value="4"
						onClick="insertArea(this);">대구</button>
					<button type="button" class="btn btn-light" value="5"
						onClick="insertArea(this);">광주</button>
					<button type="button" class="btn btn-light" value="6"
						onClick="insertArea(this);">부산</button>
					<button type="button" class="btn btn-light" value="7"
						onClick="insertArea(this);">울산</button>
					<button type="button" class="btn btn-light" value="8"
						onClick="insertArea(this);">세종특별자치시</button>
					<button type="button" class="btn btn-light" value="31"
						onClick="insertArea(this);">경기도</button>
					<button type="button" class="btn btn-light" value="32"
						onClick="insertArea(this);">강원도</button>
					<button type="button" class="btn btn-light" value="33"
						onClick="insertArea(this);">충청북도</button>
					<button type="button" class="btn btn-light" value="34"
						onClick="insertArea(this);">충청남도</button>
					<button type="button" class="btn btn-light" value="35"
						onClick="insertArea(this);">경상북도</button>
					<button type="button" class="btn btn-light" value="36"
						onClick="insertArea(this);">경상남도</button>
					<button type="button" class="btn btn-light" value="37"
						onClick="insertArea(this);">전라북도</button>
					<button type="button" class="btn btn-light" value="38"
						onClick="insertArea(this);">전라남도</button>
					<button type="button" class="btn btn-light" value="39"
						onClick="insertArea(this);">제주도</button>
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
					<label for="title">관광타입</label><br />
					<button type="button" class="btn btn-light" value="A00"
						onClick="insertContent(this);">전체</button>
					<button type="button" class="btn btn-light" value="A01"
						onClick="insertContent(this);">관광지(자연)</button>
					<button type="button" class="btn btn-light" value="A02"
						onClick="insertContent(this);">관광지(인문)</button>
					<button type="button" class="btn btn-light" value="A03"
						onClick="insertContent(this);">레포츠</button>
					<button type="button" class="btn btn-light" value="A04"
						onClick="insertContent(this);">쇼핑</button>
					<button type="button" class="btn btn-light" value="A05"
						onClick="insertContent(this);">음식</button>
					<button type="button" class="btn btn-light" value="B02"
						onClick="insertContent(this);">숙박</button>
					<button type="button" class="btn btn-light" value="C01"
						onClick="insertContent(this);">추천코스</button>
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

<div id="commonMain">
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
			<div id="selectContent"></div>
		</div>
		<nav>${pagebar}</nav>
	</article>
</div>

<script
	src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
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

		if (sigunguName != '0') {
			
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
			url : '${pageContext.request.contextPath}/widget/docallCat2Code.do',
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
						
						var myItem = data.response.body.items.item;
						console.log(myItem);
						
						$('#selectContent').empty();
				
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
							console.log("검색 ajax 끝");
					},
					
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert("Status : " + textStatus);
						alert("Error : " + errorThrown);
					}
					
				});
				
					
			},

			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status : " + textStatus);
				alert("Error : " + errorThrown);
			}

		});

	});
	
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>