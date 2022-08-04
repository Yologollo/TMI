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
	생성 : 최윤서
	작업 : 최윤서
 -->
	<div class="wrapper">
 		<div class="email_container">
 			<div class="login_title">
 				<img src="${pageContext.request.contextPath}/resources/images/title_blue.png" id="title_img"/>
		 		<h1>로그인</h1>
		 		<form:form method="post">
		 			<div class="form-box">
			            <div class="input-box">
			                <input id="email" type="text" name="email" placeholder="이메일">
			                <label for="email">이메일</label>
			            </div>
			            <div class="input-box">
			                <input id="password" type="password" name="password" placeholder="비밀번호">
			                <label for="password">비밀번호</label>
			            </div>
						<div class="checks small">
						  <input type="checkbox" id="ex_chk2"> 
						  <label for="ex_chk2">이메일저장</label> 
						</div>
			            <a href="${pageContext.request.contextPath}/" class="find_pw">비밀번호 찾기</a>

			            <input type="submit" value="이메일로 시작하기">
			            <div class="sign_up_box">
			            	<p>아직 계정이 없으신가요?</p>
				            <a href="${pageContext.request.contextPath}/login/signUp" class="sign_up">간편 가입하기</a>
			            </div>
		 			</div>
		 		</form:form>
 			</div>
 		</div>
 	</div>
</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>