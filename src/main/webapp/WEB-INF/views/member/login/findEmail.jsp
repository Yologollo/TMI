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
 		<div class="find_container">
 			<div class="find_title">
 				<img src="${pageContext.request.contextPath}/resources/images/title_blue.png" id="title_img"/>
		 		<h1>이메일 찾기</h1>
		 		<form:form name="findEmailFrm" method="POST">
		 			<div class="form-box" style="margin-top: 50px;">
		 				<div class="input-box">
			                <input id="mName" type="text" name="mName" placeholder="이름" required>
			                <label for="mName">이름</label>
			            </div>
			            <div class="input-box">
			                <input id="mPhone" type="number" name="mPhone" ng-focus="chkPhoneType('focus');" ng-blur="chkPhoneType('blur');" placeholder="핸드폰" required>
			                <label for="mPhone">휴대폰</label>
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
const mPhoneRex = /^010\d{8}$/;
$("#submitButton").click(function(){
	if ($("#mName").val() == '') {
		alert('이름을 입력해주세요.');
		$("#mName").select().focus();
		return false;
	}
	if ($("#mPhone").val() == '') {
		alert('가입한 휴대폰을 입력해주세요.');
		$("#mPhone").select().focus();
		return false;
	} 
	if(!mPhoneRex.test($("#mPhone").val())){
		alert('올바른 번호를 입력해주세요.');
		$("#mPhone").select().focus();
		return false;
	} else {
		location.href = "location.href='${pageContext.request.contextPath}/login/findEmail.do'";
	};
});

</script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>