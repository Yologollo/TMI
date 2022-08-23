<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="utf-8" />
<!-- 
	생성 : 김용민
	작업 : 김용민
 -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Travel Making Imagine" name="title" />
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberdetail.css?after">
<div class="intro_top">
	<img src="${pageContext.request.contextPath}/resources/images/planner/plannerBanner.gif"/>
</div>
<div id="commonMain" style="margin-top: 0;">
 	
 	<div id="wrapper">
 		
	 	<div id="menuContainer">
			<ul>
				<li class="mypageMenuli">
					<a href="${pageContext.request.contextPath}/mypage/memberDetail.do">My 페이지</a>
				</li>
				<hr />
				<li class="mypageMenuli">
					<a href="${pageContext.request.contextPath}/mypage/memberPlannerBoardList.do">My 게시글</a>
				</li>
				<hr />
				<li class="mypageMenuli">
					<a href="${pageContext.request.contextPath}/mypage/memberDelete.do">회원탈퇴</a>
				</li>
				<hr />
			</ul>
		</div>
		<h2>정보 변경</h2>
		<form name="memberUpdateFrm" action="${pageContext.request.contextPath}/mypage/memberUpdate.do" method="POST">
			<div id="memberInfoWrapper">
				<div class="input-group mb-3 memberInfo">
					<span class="input-group-text" id="basic-addon1">이메일</span> 
					<input type="text" class="form-control" name="mEmail" value="<sec:authentication property="principal.mEmail"/>" placeholder="이메일" required readonly>
				</div>
				
				<div class="input-group mb-3 memberInfo">	
					<span class="input-group-text" id="basic-addon1">이름</span> 
					<input type="text" class="form-control" id="mName" name="mName" value="<sec:authentication property="principal.mName"/>" placeholder="이름" required>
				</div>
				<div class="check">
	                <span id="name_chk_already" style="color:red; display:none;">이름은 한글 2글자이상 입력해주세요.</span>
				</div>
				
				<div class="input-group mb-3 memberInfo">	
					<span class="input-group-text" id="basic-addon1">닉네임</span> 
					<input type="text" class="form-control" id="mNickName" name="mNickName" value="<sec:authentication property="principal.mNickName"/>" placeholder="닉네임" required>
				</div>
				<div class="check">
	                <span class="nickname_ok" style="color:green; display:none;">이 닉네임은 사용가능합니다.</span>
					<span class="nickname_already" style="color:red; display:none;">이 닉네임은 이미 사용중입니다.</span>
					<input type="hidden" id="nicknameValid" value="0" /> <!-- 0-사용불가 1-사용가능 -->
				</div>
				
				<div class="input-group mb-3 memberInfo">	
					<span class="input-group-text" id="basic-addon1">휴대폰</span> 
					<input type="number" class="form-control" id="mPhone" name="mPhone" value="<sec:authentication property="principal.mPhone"/>" placeholder="전화번호" ng-focus="chkPhoneType('focus');" ng-blur="chkPhoneType('blur');" required>
				</div>

				<div class="memberInfoBtn">
					<input type="submit" class="btn" id="submitButton" value="수정">
					<input type="reset" class="btn" value="취소">
				</div>

			</div>
		</form>
		
		<form:form name="memberUpdatePwFrm" action="${pageContext.request.contextPath}/mypage/memberUpdatePw.do" method="POST">
			<div id="memberInfoPwWrapper">
			<h2>비밀번호 변경</h2>
				<div class="input-group mb-3 memberInfo">	
					<span class="input-group-text" id="basic-addon1">비밀번호</span> 
					<input type="password" class="form-control" id="mPassword" name="mPassword" placeholder="비밀번호" required>
				</div>
				<div class="check">
	                <span id="pw_chk_ok" style="color:green; display:none;">사용가능</span>
	                <span id="pw_chk_already" style="color:red; display:none;">영문,숫자 조합 4 ~ 16글자 이상어야 합니다.</span>
				</div>
				
				<div class="input-group mb-3 memberInfo">	
					<span class="input-group-text" id="basic-addon1">비밀번호 확인</span> 
					<input type="password" class="form-control" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 확인" required>
				</div>
				<div class="check">
	                <span id="pw2_chk_ok" style="color:green; display:none;">일치</span>
	                <span id="pw2_chk_already" style="color:red; display:none;">비밀번호가 일치하지 않습니다.</span>
				</div>
				
				<input type="hidden" name="mEmail" id="mEmail" value="<sec:authentication property="principal.mEmail"/>"/> 
				<div class="memberInfoBtn">
					<input type="submit" class="btn" id="submitButtonPw" value="수정">
					<input type="reset" class="btn" value="취소">
				</div>
			</div>
		</form:form>
		
	</div>
	
</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<script>
$("#submitButtonPw").click(function(){
	if ($("#mPassword").val() == '') {
		alert("새로운 비밀번호를 입력해주세요.")
		$("#mPassword").select().focus();
		return false;
	}
	if ($("#passwordCheck").val() == '') {
		alert("위 입력한 비밀번호를 확인해주세요.")
		$("#passwordCheck").select().focus();
		return false;
	}
	alert("비밀번호를 성공적으로 수정하였습니다. 로그인을 해주세요😃");
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
	var button_joinus = document.getElementById('submitButtonPw');
	
	if($('#mPassword').val() != $(this).val()){
		$('#pw2_chk_already').css('display', 'inline-block');
		$('#pw2_chk_ok').css('display', 'none');
		submitButtonPw.disabled = true;
		$("#passwordCheck").select().focus();
	} else {
		$('#pw2_chk_ok').css('display', 'inline-block');
		$('#pw2_chk_already').css('display', 'none');
		submitButtonPw.disabled = false;
	}
});

/* nickname 중복검사 */
document.querySelector("#mNickName").addEventListener('keyup', (e) => {
	const memberNickname = e.target.value;

	if(memberNickname.length < 2) {
		$('.nickname_already').css('display', 'none');
		$('.nickname_ok').css('display', 'none');
		$('#nicknameValud').value = 0;
		return;
	}
	
	console.log(memberNickname);
	
	$.ajax({
		url : '${pageContext.request.contextPath}/mypage/checkNickname.do',
		data : {
			mNickName : memberNickname
		},
		success(response){
			console.log(response);
			const {mNickName, available} = response;
			
			if(available){
				$('.nickname_ok').css('display', 'inline-block');
				$('.nickname_already').css('display', 'none');
				$('#nicknameValud').value = 1;
			}
			else {
				$('.nickname_already').css('display', 'inline-block');
				$('.nickname_ok').css('display', 'none');
				$('#nicknameValud').value = 0;
			}
		},
		error(jqxhr, statusText, err){
			console.log(jqxhr, statusText, err);
			
			const {responseJSON : {error}} = jqxhr;
			alert(error);
		}
		
	});
	
});

const mNickNameRex = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
const mNameRex = /^[가-힣]{2,}$/;
const mPhoneRex = /^010\d{8}$/;

$('#mName').blur(function() {
	if(mNameRex.test($('#mName').val())){
		$('#name_chk_already').css('display', 'none');
	} else {
		$('#name_chk_already').css('display', 'inline-block');
	}
})

/* 휴대폰 포커스에 따라 text | number 사용 */
$(document).ready(function() { 
    $("#mPhone").focus(focused); //input에 focus일 때
    $("#mPhone").blur(blured);   //focus out일 때
})

function focused(){
	var input = $("#mPhone").val();
	//input안에서 하이픈(-) 제거
	var phone = input.replace( /-/gi, '');
	//number 타입으로 변경(숫자만 입력)
	$("#mPhone").prop('type', 'number');
	$("#mPhone").val(phone);
}

function blured(){
	var input = $("#mPhone").val();
	//숫자에 하이픈(-) 추가
	var phone = chkItemPhone(input);
	//text 타입으로 변경
	$("#mPhone").prop('type', 'text');
	$("#mPhone").val(phone);
}
/* submit시에는 하이픈제거 */
document.querySelector('#submitButton').addEventListener('click', (event) => {
	var input = $("#mPhone").val();
	var phone = input.replace( /-/gi, '');
	$("#mPhone").prop('type', 'number');
	$("#mPhone").val(phone);
});

function chkItemPhone(temp) {
	var number = temp.replace(/[^0-9]/g, "");
	var phone = "";
	
	if (number.length < 9) {
		return number;
	} else if (number.length < 10) {
        phone += number.substr(0, 2);
	    phone += "-";
	    phone += number.substr(2, 3);
	    phone += "-";
	    phone += number.substr(5);
	} else if (number.length < 11) {
	    phone += number.substr(0, 3);
	    phone += "-";
	    phone += number.substr(3, 3);
	    phone += "-";
	    phone += number.substr(6);
	} else {
	    phone += number.substr(0, 3);
	    phone += "-";
	    phone += number.substr(3, 4);
	    phone += "-";
	    phone += number.substr(7);
	}
	
	return phone;
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>