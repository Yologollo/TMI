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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/createplanner.css?after">
<!-- 
	생성 : 김용민
	작업 : 김용민
 -->
<script>

$(document).ready(function() {
	$("#btnPlannerSave").click(function() {
		var date = [];
		var memo = [];
		var y = [];
		var x = [];
		var time = [];
		
		var isValid = true;
		
		if(isValid == true){
            $('.plannerDetailDateInfoFirstId').each(function(i) {
                date.push($(this).attr("data-date"));
            });
            
            $('.plannerDetailDateInfoMemoInput').each(function(i) {
                if($(this).val() == null){
                    memo.push(" ");
                } else{
                    memo.push($(this).val());
                }
            });

            $('.plannerDetailDateInfoFirstId').each(function(i) {
                y.push($(this).attr("data-y"));
            });

            $('.plannerDetailDateInfoFirstId').each(function(i) {
                x.push($(this).attr("data-x"));
            });

            $('.plannerDetailDateInfoTimeInput').each(function(i) {
                time.push($(this).val());
            });

            for(var i = 0; i < time.length; i++){
                if(time[i] == "") {
                    alert("시간은 필수 입력 항목입니다.");
                    return false;
                }
            }
            
            $.ajax({
                url:"${pageContext.request.contextPath}/planner/savePlanner.do?pNo=${planner.PNo}",
                data:{
                    date : date,
                    memo : memo,
                    y : y,
                    x : x,
                    time : time
                },
                type:"post",
                success: function (data) {
                    location.href="${pageContext.request.contextPath}/" + data;
                }
            });
		}
	});
});
</script>
<div id="createPlannerMain">
	<div id=topBar>
		<div id="topBarBtnWrapper">
			<button type="button" class="btn btn-primary btn-lg" id="btnPlannerSave" data-no="${planner.PNo}">저장</button>
			<button type="button" class="btn btn-danger btn-lg" id="btnPlannerClose" data-no="${planner.PNo}">닫기</button>
			<input type="text" value="${planner.PNo}"/>
		</div>
	</div>

<%-- 	<form action="${pageContext.request.contextPath}/planner/savePlanner.do" name="plannerSaveFrm" method="POST">
		<input type="hidden" name="pNo" />
	</form> --%>
	
	<form action="${pageContext.request.contextPath}/planner/cnacelPlanner.do" name="plannerCancelFrm" method="POST">
		<input type="hidden" name="pNo" />
	</form>

	<div id=palnnerInfo>
	
		<div id="palnnerDate">
			<div id="palnnerDateInfoFirstId">
				<span>일정</span>
			</div>
			
			<c:forEach items="${days}" var="day" varStatus="status">
                <div class="plannerDateInfo" data-date="${day}" onclick="plansChange(${status.count})">
                    <span class="palnnerDateInfoSpanClass">DAY${status.count}</span><br />
                    <fmt:formatDate value="${day}" pattern="MM.dd" />
                </div>
            </c:forEach>
            
		</div>
		<div id="plannerDetailDate">
		
			<c:forEach items="${days}" var="day" varStatus="status">
				<div class="plannerDetailDateInfoFirstId" data-date="${day}">
					<span>DAY ${status.count} | <fmt:formatDate value="${day}" pattern="MM.dd E요일" /></span>
				</div>
			</c:forEach>

		</div>
		<div id="plannerDetailPlace">
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div id="plannerDetailPlaceFirstId">
						<div id="plannerDetailPlaceFirstIdWrapper">
							<div class="option">
								<div>
									<form onsubmit="searchPlaces(); return false;">
										<input type="text" class="form-control" value="KH정보교육원" id="keyword">
										<button type="submit" id="keywordSearchBtn" class="btn btn-primary">검색</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="plannerDetailPlaceInfo">
						<div class="plannerDetailPlaceInfoAddress">
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="palnneKakaoAPI">
			<!-- 카카오 API -->
		</div>
	</div>
	
</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<script>

// 플래너 닫기
document.querySelectorAll("#btnPlannerClose").forEach((btn) => {
	btn.addEventListener('click', (e) => {
		console.log(e.target);
		console.log(e.target.dataset.pNo);
		document.plannerCancelFrm.pNo.value = e.target.dataset.no;
		document.plannerCancelFrm.submit(); // submit 이벤트핸들러를 호출하지 않는다.
	});
});

// 플래너 저장
/* document.querySelectorAll("#btnPlannerSave").forEach((btn) => {
	btn.addEventListener('click', (e) => {
		console.log(e.target);
		console.log(e.target.dataset.pNo);
		document.plannerSaveFrm.pNo.value = e.target.dataset.no;
		document.plannerSaveFrm.submit(); // submit 이벤트핸들러를 호출하지 않는다.
	});
}); */

// DAY 버튼 클릭시 해당하는 날짜의 일정만 보여주는 함수
var planslide =  document.querySelectorAll(".plannerDetailDateInfoFirstId");
var plans_current = 1;

function plansChange(n){
    n -= 1;
    for(var i = 0; i < planslide.length; i++){
        planslide[i].style.display = "none";
    }
    planslide[n].style.display = "block";
}

plansChange(plans_current);

// 장소 검색 후 추가 버튼 클릭시 일정 부분에 일정 추가하는 함수
function planInsert(place_name, place_y, place_x){
    var parent =  $('.plannerDetailDateInfoFirstId[style*="display: block"]');
    var data_date = parent.attr('data-date');
    var num = parent.children().length; // 하위 엘리먼트기에 일정 - 제목 (DAY) 부분도 포함됨

   if(num < 10){ // 일정은 9개까지만 추가 가능
       parent.append(getHtml(place_name, place_y, place_x, num, data_date));
   } else{
       alert("일정은 최대 9개로 제한됩니다.");
   }
    


}

// 일정 추가시 일정 관련 <div> 코드 생성해주는 함수
function getHtml(place_name, place_y, place_x, num, data_date){
    var div = "<div class=\"plannerDetailDateInfo\" data-date=\"" + data_date + "\" data-y=\"" + place_y + "\" data-x=\"" + place_x + "\" data-planNo=\"\">";
    div += "<button type=\"button\" class=\"plannerDetailDateInfoClose btn-close\" onclick=\"planDelete(\'" + num +  "\')\"></button>";
    div += "<div class=\"plannerDetailDateInfoTitle\">";
    div += "<span class=\"plannerDetailDateInfoTitleNumberSpan\">" + num + ". " +"</span>";
	div += "<span class=\"plannerDetailDateInfoTitleSpan\">" + place_name + "</span>";
	div += "</div>";
	div += "<div class=\"plannerDetailDateInfoTime\">";
	div += "<span class=\"plannerDetailDateInfoTimeLabel\">시간</span>";
	div += "<input type=\"time\" class=\"form-control\" placeholder=\"시간\" class=\"plannerDetailDateInfoTimeInput\">";
	div += "</div>";
	div += "<div class=\"plannerDetailDateInfoMemo\">";
	div += "<span class=\"plannerDetailDateInfoMemoLabel\">메모</span>";
	div += "<input type=\"text\" class=\"form-control\" placeholder=\"메모\" class=\"plannerDetailDateInfoMemoInput\">";
	div += "</div>";
	div += "</div>";
	


    return div;
}

// 일정 부분에서 삭제(X) 버튼 클릭시 해당 div 삭제
function planDelete(num){
    var parent =  $('.plannerDetailDateInfoFirstId[style*="display: block"]');
    var kid = parent.children().eq(num); // 일정 부분에 제목도 자식에 포함되기에 index +1
    var next_kids = kid.nextAll();

    kid.detach();

    next_kids.each(function (index, element){
        var btn = "planDelete(" + num + ")";
        $(this).find('button').attr("onclick", btn);
        ++ num;
    });
}

</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d3b1f2155fb7376c8e3ce304aebd498b&libraries=services"></script>
<script>
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('palnneKakaoAPI'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h3>' + places.place_name + '</h3>';

    if (places.road_address_name) {
        itemStr +=  '   <span class="gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';   
                
	  itemStr += '<div class="placelistDiv"><button class="btn btn-primary placelistDivBtn" onclick="planInsert(\'' + places.place_name + '\',\'' + places.y + '\',\'' + places.x +  '\')">+</button></div>';

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;font-size:12px;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>