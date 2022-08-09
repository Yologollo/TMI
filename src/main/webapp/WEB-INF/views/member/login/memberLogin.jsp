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
		 		<form:form name="memberLoginFrm" method="POST">
		 			<div class="form-box">
			            <div class="input-box">
			                <input id="mEmail" type="text" name="mEmail" placeholder="이메일">
			                <label for="mEmail">이메일</label>
			            </div>
			            <div class="input-box">
			                <input id="mPassword" type="password" name="mPassword" placeholder="비밀번호">
			                <label for="mPassword">비밀번호</label>
			            </div>
						<div class="checks small">
						  <input type="checkbox" id="ex_chk2" name="remember-me"> 
						  <label for="ex_chk2" name="">이메일저장</label> 
						</div>
			            <a href="${pageContext.request.contextPath}/login/findPw.do" class="find_pw">비밀번호 찾기</a>

			            <input type="submit" value="로그인" onClick="location.href='${pageContext.request.contextPath}/login/memberLogin.do'">
			            <div class="sign_up_box">
			            	<p>아직 계정이 없으신가요?</p>
				            <a href="${pageContext.request.contextPath}/login/memberEnroll.do" class="sign_up">가입하기</a>
			            </div>
		 			</div>
		 		</form:form>
 			</div>
 		</div>
 	</div>
</div>
<script>

document.memberLoginFrm.addEventListener('submit', (e) => {
	const mEmail = document.querySelector("#mEmail");
	const mPassword = document.querySelector("#mPassword");

	// email
	if(!/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/.test(mEmail.value)){
		swal.fire('유효성 검사[이메일]', "유효한 이메일을 입력하세요.", 'warning');
		e.preventDefault();
		return;
	}
	// password
	/* if(!/^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{4,16}$/.test(mPassword.value)){
		swal.fire('유효성 검사[비밀번호]', "비밀번호는 영문,숫자 조합 4 ~ 16글자 이상어야 합니다.", 'warning');
		e.preventDefault();
		return;
	} */

})
</script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>