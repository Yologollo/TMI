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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<div id="commonMain">
<!-- 
	생성 : 김용민, 최윤서
	작업 : 김용민, 최윤서
 -->
 	<div class="wrapper">
 		<div class="login_container">
 			<div class="login_title">
 				<img src="${pageContext.request.contextPath}/resources/images/title_blue.png" id="title_img"/>
		 		<h1>로그인</h1>
		 		<input type="button" value="카카오로 1초만에 시작하기" onClick="location.href='${pageContext.request.contextPath}/'" class="kakao_login_btn">
		 		<input type="button" value="이메일로 시작하기" onClick="location.href='${pageContext.request.contextPath}/login/email'" class="email_login_btn">
 			</div>
 		</div>
 	</div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>