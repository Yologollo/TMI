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
		 		<form:form name="memberSignUpFrm" method="POST">
			 		<div class="form-box">
			 			<div class="input-box">
			                <input id="mName" type="text" name="mName" placeholder="아이디" required>
			                <label for="mName">이름</label>
			                <div class="check">
				                <span id="name_chk_already" style="color:red; display:none;">이름은 한글 2글자이상 입력해주세요.</span>
							</div>
			            </div>
			            
			 			<div class="input-box">
			                <input id="mEmail" type="email" name="mEmail" placeholder="abcde@naver.com" required>
			                <label for="mEmail">이메일</label>
				            <div class="check">
				                <span class="email_ok" style="color:green; display:none;">이 이메일은 사용가능합니다.</span>
								<span class="email_already" style="color:red; display:none;">이 이메일은 이미 사용중입니다.</span>
								<span class="email_chk_already" style="color:red; display:none;">이메일 형식이 맞지 않습니다.</span>
								<input type="hidden" id="emailValid" value="0" /> <!-- 0-사용불가 1-사용가능 -->
				            </div>
			            </div >

			 			<div class="input-box">
			                <input id="mPhone" type="number" name="mPhone" ng-focus="chkPhoneType('focus');" ng-blur="chkPhoneType('blur');" placeholder="예)010-1234-5678" required>
			                <label for="mPhone">휴대폰</label>
			            </div>
			            
			 			<div class="input-box">
			                <input id="mNickName" type="text" name="mNickName" placeholder="2글자이상" required>
			                <label for="mNickName">닉네임</label>
			                <div class="check">
				                <span class="nickname_ok" style="color:green; display:none;">이 닉네임은 사용가능합니다.</span>
								<span class="nickname_already" style="color:red; display:none;">이 닉네임은 이미 사용중입니다.</span>
								<input type="hidden" id="nicknameValid" value="0" /> <!-- 0-사용불가 1-사용가능 -->
							</div>
			            </div>
			            
			            <div class="input-box">
			                <input id="mPassword" type="password" name="mPassword" placeholder="비밀번호" required>
			                <label for="mPassword">비밀번호</label>
			                <div class="check">
				                <span id="pw_chk_ok" style="color:green; display:none;">사용가능</span>
				                <span id="pw_chk_already" style="color:red; display:none;">영문,숫자 조합 4 ~ 16글자 이상어야 합니다.</span>
							</div>
			            </div>
			            
			            <div class="input-box">
			                <input id="passwordCheck" type="password" name="password" placeholder="비밀번호" required>
			                <label for="passwordCheck">비밀번호 확인</label>
			                <div class="check">
				                <span id="pw2_chk_ok" style="color:green; display:none;">일치</span>
				                <span id="pw2_chk_already" style="color:red; display:none;">비밀번호가 일치하지 않습니다.</span>
							</div>
			            </div>
			            
			            <div class="form_footer">
			            	<span class="footer_policy">
			            		통합 계정 및 서비스 이용약관 ( TMI ), 개인정보취급방침에 동의합니다.
			            	</span>
			            	<div class="checks small">
							  <input type="checkbox" id="ex_chk2"> 
							  <label for="ex_chk2">이용약관 동의</label> 
							</div>
			            </div>
			            
			            <div class="signup_box">
			            	<hr class="signup_line">
			            	<span class="signup_title">회원가입</span>
			            	<input type="submit" id="submitButton" value="가입하기">
			            </div>
		            </div>
		 		</form:form>
	 		</div>
 		</div>
	</div>

</div>
<script>
/* 이용약관 체크시*/

$("#submitButton").click(function(){
	//체크박스가 체크되었는지 판별
	if($("#ex_chk2").is(":checked")){
		location.href = "location.href='${pageContext.request.contextPath}/login/memberEnroll.do'";
	} else {
		if(!$("#ex_chk2").is(":checked")){
			swal.fire('이용약관 동의', "약관을 동의하셔야 합니다.", 'warning');
			$('#ex_chk2').focus();  // 해당 체크박스로 포커스 이동.
			return false;
		}
	}
});



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


/* 휴대폰 하이픈추가 */
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
		url : '${pageContext.request.contextPath}/login/checkNickname.do',
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

/* email 중복검사 */
document.querySelector("#mEmail").addEventListener('keyup', (e) => {
	const memberEmailVal = e.target.value;
	const mEmailRex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	
	if(memberEmailVal.length < 4) {
		$('.email_already').css('display', 'none');
		$('.email_ok').css('display', 'none');
		$('#emailValud').value = 0;
		return;
	}
	
	$('#mEmail').blur(function() {
		if(mEmailRex.test($('#mEmail').val())){
			$('.email_chk_already').css('display', 'none');
		} else {
			$('.email_ok').css('display', 'none');
			$('.email_already').css('display', 'none');
			$('.email_chk_already').css('display', 'inline-block');
		}
	})
	
	console.log(memberEmailVal);
	
	$.ajax({
		url : '${pageContext.request.contextPath}/login/checkEmail.do',
		data : {
			mEmail : memberEmailVal
		},
		success(response){
			console.log(response);
			const {mEmail, available} = response;
			
			if(available){
				$('.email_ok').css('display', 'inline-block');
				$('.email_already').css('display', 'none');
				$('.email_chk_already').css('display', 'none');
				$('#emailValud').value = 1;
			}
			else {
				$('.email_already').css('display', 'inline-block');
				$('.email_ok').css('display', 'none');
				$('.email_chk_already').css('display', 'none');
				$('#emailValud').value = 0;
			}
		},
		error(jqxhr, statusText, err){
			console.log(jqxhr, statusText, err);
			
			const {responseJSON : {error}} = jqxhr;
			alert(error);
		}
		
	});
	
});

/* 정규식 */
const empRex = /\s/g;
const mNickNameRex = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
const mNameRex = /^[가-힣]{2,}$/;
const mPasswordRex = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{4,16}$/;
const mPhoneRex = /^010\d{8}$/;

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
	} else {
		$('#pw2_chk_ok').css('display', 'inline-block');
		$('#pw2_chk_already').css('display', 'none');
	}
});
$('#mName').blur(function() {
	if(mNameRex.test($('#mName').val())){
		$('#name_chk_already').css('display', 'none');
	} else {
		$('#name_chk_already').css('display', 'inline-block');
	}
})



</script>
<!-- alert 디자인창 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>