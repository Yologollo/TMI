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
		 		<h1>비밀번호 변경</h1>
		 		<form:form name="findPwUpdateFrm" method="POST">
		 			<div class="form-box" style="margin-top: 50px;">
		 				<div class="input-box" style="margin: 20px 0;">
			                <input id="mPassword" type="password" name="mPassword" placeholder="닉네임">
			                <label for="mPassword">비밀번호</label>
			                <div class="check">
				                <span id="pw_chk_ok" style="color:green; display:none;">사용가능</span>
				                <span id="pw_chk_already" style="color:red; display:none;">영문,숫자 조합 4 ~ 16글자 이상어야 합니다.</span>
							</div>
			            </div>
			            <div class="input-box">
			                <input id="passwordCheck" type="password" name="passwordCheck" placeholder="이메일">
			                <label for="passwordCheck">비밀번호 확인</label>
							<div class="check">
				                <span id="pw2_chk_ok" style="color:green; display:none;">일치</span>
				                <span id="pw2_chk_already" style="color:red; display:none;">비밀번호가 일치하지 않습니다.</span>
							</div>
			            </div>
						<input type="hidden" name="mEmail" id="mEmail" value="${mEmail}"/> 
			            <input type="submit" value="비밀번호 변경" id="submitButton">
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
	if ($("#mPassword").val() == '') {
		alert("새로운 비밀번호를 입력해주세요.")
		$("#mPassword").select().focus();
		return false;
	}
	if ($("#passwordCheck").val() == '') {
		alert("위 입력한 비밀번호를 확인해주세요.")
		$("#passwordCheck").select().focus();
		return false;
	} else {
		location.href = "location.href='${pageContext.request.contextPath}/login/findPwUpdate.do'";
	};
});

const mPasswordRex = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{4,16}$/;

$('#mPassword').blur(function() {
	if(mPasswordRex.test($('#mPassword').val())){
		$('#pw_chk_ok').css('display', 'inline-block');
		$('#pw_chk_already').css('display', 'none');
	} else {
		$('#pw_chk_already').css('display', 'inline-block');
		$('#pw_chk_ok').css('display', 'none');
	}
});
$('#passwordCheck').blur(function() {
	if($('#mPassword').val() != $(this).val()){
		$('#pw2_chk_already').css('display', 'inline-block');
		$('#pw2_chk_ok').css('display', 'none');
		$("#passwordCheck").select().focus();
	} else {
		$('#pw2_chk_ok').css('display', 'inline-block');
		$('#pw2_chk_already').css('display', 'none');
	}
});
</script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>