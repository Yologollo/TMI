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
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/ebc38c8460.js" crossorigin="anonymous"></script>
	<!-- 사용자작성 CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
</head>
<body>	
<div id="container">
	<!-- header코드 들어갈 부분 -->
	<div id="video_area">
    	<video src="${pageContext.request.contextPath}/resources/video/mainPage.mp4" id="background_video" auto autoplay loop muted volume="0"></video>
	</div>
	<header class="header" id="header">
            <nav class="nav container">
                <a href="${pageContext.request.contextPath}" class="nav_logo">TMI</a>
                <div class="nav_menu" id="nav-menu">
                    <ul class="nav_list grid" style="margin-bottom: 0px;">
                        <li class="nav_item">
                            <a href="#" class="nav_link">
                                <i class="nav_icon"></i> 플래너
                            </a>
                        </li>
                        <li class="nav_item">
                            <a href="#" class="nav_link">
                                <i class="nav_icon"></i> 이용방법
                            </a>
                        </li>
                        <li class="nav_item">
                            <a href="#" class="nav_link">
                                <i class="nav_icon"></i> 게시판
                            </a>
                        </li>
                        <li class="nav_item">
                            <a href="#" class="nav_link">
                                <i class="nav_icon"></i> 마이페이지
                            </a>
                        </li>
                        <li class="nav_item">
                            <a href="#" class="nav_link">
                                <i class=" nav_icon"></i> 로그인
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
    <main class="main">
<section id="content">