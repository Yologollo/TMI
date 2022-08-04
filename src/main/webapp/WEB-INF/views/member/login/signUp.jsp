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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css">
<div id="commonMain">
<!-- 
	생성 : 최윤서
	작업 : 최윤서
 -->
	<div class="wrapper">
 		<div class="signup_container">
			<div class="signup_title">
 				<img src="${pageContext.request.contextPath}/resources/images/title_blue.png" id="title_img"/>
		 		<h1>회원가입</h1>
		 		<form:form method="post">
			 		<div class="form-box">
			 			<div class="input-box">
			                <input id="name" type="text" name="name" placeholder="아이디">
			                <label for="name">이름</label>
			            </div>
			 			<div class="input-box">
			                <input id="email" type="text" name="email" placeholder="abcde@naver.com">
			                <label for="email">이메일</label>
			            </div>
			 			<div class="input-box">
			                <input id="phone" type="tel" name="phone" placeholder="(-없이)01012345678">
			                <label for="phone">휴대폰</label>
			            </div>
			 			<div class="input-box">
			                <input id="nickName" type="text" name="nickName" placeholder="2글자이상">
			                <label for="nickName">닉네임</label>
			            </div>
			            <div class="input-box">
			                <input id="password" type="password" name="password" placeholder="비밀번호">
			                <label for="password">비밀번호</label>
			            </div>
			            <div class="input-box">
			                <input id="passwordCheck" type="password" name="password" placeholder="비밀번호">
			                <label for="passwordCheck">비밀번호 확인</label>
			            </div>
			            <input type="submit" value="가입하기">
			            <div class="form_footer">
			            	<span class="footer_policy">
			            		통합 계정 및 서비스 이용약관 ( TMI ), 개인정보취급방침에 동의합니다.
			            	</span>
			            	<div class="checks small">
							  <input type="checkbox" id="ex_chk2"> 
							  <label for="ex_chk2">이용약관 동의</label> 
							</div>
			            </div>
			            <div class="signup_kakao">
			            	<hr class="kakao_line">
			            	<span class="kakao_title">간편 회원가입</span>
			            	<input type="button" value="카카오 로그인" onClick="location.href='${pageContext.request.contextPath}/'" class="kakao_login_btn">
			            </div>
		            </div>
		 		</form:form>
	 		</div>
 		</div>
	</div>

	

</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>