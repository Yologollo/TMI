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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<div id="commonMain">

<!-- 
	생성 : 김용민
	작업 : 김용민 권민지
 -->
 	<h1>이용방법</h1>
 	 
 	 <body>
        <div class="body">
            <div>
                    <div id="featured">
                        <h3>Travel Making Imagine </h3>
                    </div>
                </div>

                <div>
                    <ul class="blog">
                        <li>
                            
                            <img src="image/map_icon.png" alt="">
                            <h3>관광정보</h3>
                            <p>여행 떠날 지역을 검색하세요. <br>
                                검색하신 지역의 여행정보를 <br> 확인 할 수 있습니다. </p>
                            <a href="blog.html">Click Me!</a>
                        </li>
                       
                        <li>
                            <img src="image/bag_icon.png" alt="">
                            <h3>게시판</h3>
                            <p>내가 직접 여행계획을 세워 플래너를 <br> 작성 할수 있고, 인기있는 플래너를 <br>눌러 확인 할 수 있습니다.</p>
                            <a href="blog.html">Click Me!</a>
                        </li>
                      
                        <li>
                            <img src="image/travel_icon.png" alt="">
                            <h3>여행 친구 찾기</h3>
                            <p>나를 위한 여행친구 <br>
                                새로운 친구와 새로운 추억을<br>  쌓을 수있습니다.</p>
                            <a href="blog.html">Click Me!</a>
                        </li>

                        <li>
                            <img src="image/smile_icon.png" alt="">
                            <h3>마이페이지</h3>
                            <p>내가 작성한 글을 보거나 담아둔 게시글 확인 및 수정
                                <br> 나의 정보도 확인 할 수 있습니다.
                            </p>
                            <a href="blog.html">Click Me!</a>
                        </li>
                   
                        <li>
                            <img src="image/login_icon.png" alt="">
                            <h3>로그인 & 회원가입</h3>
                            <p>TMI 홈페이지<br>
                                 더 자세히 이용하시려면
                                회원가입 또는 로그인 해주세요! <br>
                                많은 정보를 얻을 수 있습니다.
                            </p>
                            <a href="blog.html">Click Me!</a>
                        </li>
                  

                    </ul>
                </div>
            </div>


            
</body>
 	 
 	 

</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>