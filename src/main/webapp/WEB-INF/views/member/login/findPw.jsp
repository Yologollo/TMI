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
		 		<h1>비밀번호 찾기</h1>
		 		<form:form name="findPwFrm" method="POST">
		 			<div class="form-box" style="margin-top: 50px;">
		 				<div class="input-box">
			                <input id="mNickName" type="text" name="mNickName" placeholder="닉네임" required>
			                <label for="mNickName">닉네임</label>
			            </div>
			            <div class="input-box">
			                <input id="mEmail" type="email" name="mEmail" placeholder="이메일" required>
			                <label for="mEmail">이메일</label>
			            </div>
			            <input type="submit" value="찾기" id="submitButton">
			            <div class="sign_up_box">
			            	<p>로그인창으로 돌아가시겠습니까?</p>
				            <a href="${pageContext.request.contextPath}/login/memberLogin.do" class="sign_up">로그인</a>
			            </div>
		 			</div>
		 		</form:form>
 			</div>
 		</div>
 	</div>
</div>
<script>
$("#submitButton").click(function(){
	if ($("#mNickName").val() == '') {
		alert('닉네임을 입력해주세요.');
		$("#mNickName").select().focus();
		return false;
	}
	if ($("#mEmail").val() == '') {
		alert('이메일을 입력해주세요.');
		$("#mEmail").select().focus();
		return false;
	} else {
		location.href = "location.href='${pageContext.request.contextPath}/login/findPw.do'";
	};
});

</script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>