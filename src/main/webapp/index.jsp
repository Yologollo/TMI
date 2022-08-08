<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<style>
#video_area{
    width:25%;
    border: 1px solid red;
}
#background_video {
    max-width:100%;
    height: auto;
    border: 1px solid black;
}
</style>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css">
    <div id="video_area">
        <video src="${pageContext.request.contextPath}/resources/video/mainPage.mp4" id="background_video" auto autoplay loop muted volume="0"></video>
    </div>
    
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="Travel Making Imagine" name="title" />
</jsp:include>
<!-- 
    생성 : 김용민, 최윤서
    작업 : 김용민, 최윤서
 -->
     <div style="width:auto; height:100vh; border:1px solid blue; display:flex; margin:auto 0;"></div>
    <div>
    <h1 class="section_title">${sessionScope.loginMember}</h1>
    <h2 class="section_subtitle">테스트 커밋</h2>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    </div>
    
    <div class="menu">
       <ul>
        <li><a href="#" class="item" onclick="javascript:window.scrollTo(0,0)"></a></li>
        <li><a href="#" class="item" onclick="location.href='${pageContext.request.contextPath}/board/planner/plannerBoard.do'"></a></li>
        <li><a href="#" class="item" onclick="location.href='${pageContext.request.contextPath}/board/planner/plannerBoard.do'"></a></li>
        <li><a href="#" class="item" onclick="location.href='${pageContext.request.contextPath}/board/planner/plannerBoard.do'"></a></li>
    </ul>
</div>

    <script>
  //side menu
    console.clear();
    $(window).scroll(function() {
        let scrollTop = $(this).scrollTop();
        console.log(scrollTop)
        
        if ( scrollTop < 1000) {
            scrollTop = 1000;
        }
        else if ( scrollTop > 96000 ) {
            scrollTop = 96000;
        }
        
        let duration = 1000;
        $('.menu').stop().animate({top:scrollTop}, duration);
        
        //console.log(scrollTop);
    });
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>