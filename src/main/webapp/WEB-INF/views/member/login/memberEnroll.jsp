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
		 		<form name="memberSignUpFrm" method="POST">
			 		<div class="form-box">
			 			<div class="input-box">
			                <input id="mName" type="text" name="mName" placeholder="아이디" required>
			                <label for="mName">이름</label>
			            </div>
			 			<div class="input-box">
			                <input id="mEmail" type="text" name="mEmail" placeholder="abcde@naver.com" required>
			                <label for="mEmail">이메일</label>
			            </div>
			 			<div class="input-box">
			                <input id="mPhone" type="tel" name="mPhone" placeholder="(-없이)01012345678" required>
			                <label for="mPhone">휴대폰</label>
			            </div>
			 			<div class="input-box">
			                <input id="mNickName" type="text" name="mNickName" placeholder="2글자이상" required>
			                <label for="mNickName">닉네임</label>
			            </div>
			            <div class="input-box">
			                <input id="mPassword" type="password" name="mPassword" placeholder="비밀번호" required>
			                <label for="mPassword">비밀번호</label>
			            </div>
			            <div class="input-box">
			                <input id="passwordCheck" type="password" name="password" placeholder="비밀번호" required>
			                <label for="passwordCheck">비밀번호 확인</label>
			            </div>
			            <input type="submit" value="가입하기" onClick="location.href='${pageContext.request.contextPath}/login/memberEnroll.do'">
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
			            	<input type="button" value="카카오 로그인" class="kakao_login_btn">
			            </div>
		            </div>
		 		</form>
	 		</div>
 		</div>
	</div>

</div>
<script>
document.memberSignUpFrm.addEventListener('submit', (e) => {
	const mNickName = document.querySelector("#mNickName");
	const mName = document.querySelector("#mName");
	const mEmail = document.querySelector("#mEmail");
	const mPassword = document.querySelector("#mPassword");
	const passwordCheck = document.querySelector("#passwordCheck");
	const mPhone = document.querySelector("#mPhone");
	
	// nickName
	if(!/^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/.test(mNickName.value)){
		swal.fire('유효성 검사[닉네임]', "닉네임 문자 2글자이상 16글자이하로 입력해주세요.", 'warning');
		e.preventDefault();
		return;
	}
	// name
	if(!/^[가-힣]{2,}$/.test(mName.value)){
		swal.fire('유효성 검사[이름]', "이름은 한글 2글자이상 입력해주세요.", 'warning');
		e.preventDefault();
		return;
	}
	// email
	if(!/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/.test(mEmail.value)){
		swal.fire('유효성 검사[이메일]', "유효한 이메일을 입력하세요.", 'warning');
		e.preventDefault();
		return;
	}
	// password
	if(!/^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{4,16}$/.test(mPassword.value)){
		swal.fire('유효성 검사[비밀번호]', "비밀번호는 영문,숫자 조합 4 ~ 16글자 이상어야 합니다.", 'warning');
		e.preventDefault();
		return;
	}
	if(!passwordCheck.onblur()){
		return;		
	}
	// phone
	if(!/^010\d{8}$/.test(mPhone.value)){
		swal.fire('유효성 검사[전화번호]', "유효한 전화번호를 입력하세요.", 'warning');
		e.preventDefault();
		return;
	}
})

const passwordValidator = () => {
	const mPassword = document.querySelector("#mPassword");	
	const passwordCheck = document.querySelector("#passwordCheck");
	if(password.value !== passwordCheck.value){
		swal.fire('비밀번호 불일치', "두 비밀번호가 일치하지 않습니다.", 'warning');
		mPassword.select();
	}
};
document.querySelector("#passwordCheck").addEventListener('blur', passwordValidator);


</script>
<!-- alert 디자인창 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>