<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 
	생성 : 김용민, 최윤서
	작업 : 김용민, 최윤서
 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${param.title}</title>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/ebc38c8460.js" crossorigin="anonymous"></script>
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<!-- 사용자작성 CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
</head>
<script>
	<c:if test="${!empty msg}">
		alert('${msg}');
	</c:if>
</script>
<body>	
	<sec:authorize access="isAuthenticated()">
		<script>
		const mEmail = '<sec:authentication property="principal.username"/>';
		</script>
	</sec:authorize>
<div id="container">
	<!-- header코드 들어갈 부분 -->
	<header class="header" id="header">
            <nav class="nav container">
                <a href="${pageContext.request.contextPath}" class="nav_logo">
                	<img src="${pageContext.request.contextPath}/resources/images/title_white.png" id="title_img"/>
                </a>
                <div class="nav_menu" id="nav-menu">
                    <ul class="nav_list grid" style="margin-bottom: 0px;">
                    	<!-- 비회원도 보이는 목록 -->
                        <li class="nav_item">
                            <a href="${pageContext.request.contextPath}/aboutus" class="nav_link" id="nav_color">
                                <i class="nav_icon"></i> 이용방법
                            </a>
                        </li>
                        <li class="nav_item">
                            <a href="${pageContext.request.contextPath}/board" class="nav_link" id="nav_color">
                                <i class="nav_icon"></i> 게시판
                            </a>
                        </li>

                        
                        <li class="nav_item">
                            <a href="${pageContext.request.contextPath}/admin/memberList.do" class="nav_link" id="nav_color">
                                <i class="nav_icon"></i> 회원관리
                            </a>
                        </li>
                        
                        <!-- 로그인 후 -->
						<sec:authorize access="isAuthenticated()">
                        <li class="nav_item">
                            <a href="${pageContext.request.contextPath}/planner/myplanner" class="nav_link" id="nav_color">
                                <i class="nav_icon"></i> 플래너
                            </a>
                        </li>
                        <li class="nav_item">
                            <a href="${pageContext.request.contextPath}/mypage" class="nav_link" id="nav_color">
                                <i class="nav_icon"></i> 마이페이지
                            </a>
                        </li>
                        <form:form id="logoutFrm" action="${pageContext.request.contextPath}/login/memberLogout.do" method="POST">
	                        <li class="nav_item">
	                            <a href="#" onclick="return logoutFrm()"class="nav_link" id="nav_color">
	                                <i class=" nav_icon"></i> 로그아웃
	                            </a>
	                        </li>
                        </form:form>
						</sec:authorize>
                        
                        <!-- 로그인 전 -->
						<sec:authorize access="isAnonymous()">
                        <li class="nav_item">
                            <a href="${pageContext.request.contextPath}/login/memberLogin" class="nav_link" id="nav_color">
                                <i class=" nav_icon"></i> 로그인
                            </a>
                        </li>
						</sec:authorize>
                    </ul>
                </div>
            </nav>
            <!-- 로그인 후 -->
            <c:if test="${!empty loginMember}">
            
            </c:if>
            <!-- 로그인 전 -->
            <c:if test="${empty loginMember}">
            
            </c:if>
	</header>
	<script>
	/* 로그아웃 a태그를 submit 폼제출 */
	function logoutFrm() {
		document.getElementById('logoutFrm').submit();
	}
	
	function scrollHeader(){
	    if(this.scrollY >= 40) {
	        $('#header').addClass('scroll-header');
	        $('.nav_link').addClass('nav_color_b');
	        $('#title_img').attr('src','${pageContext.request.contextPath}/resources/images/title_blue.png')
	    } else{
	    	$('#header').removeClass('scroll-header');
	    	$('.nav_link').removeClass('nav_color_b');
	        $('#title_img').attr('src','${pageContext.request.contextPath}/resources/images/title_white.png')
	    } 
	}
	window.addEventListener('scroll', scrollHeader)
	</script>
<section id="content">