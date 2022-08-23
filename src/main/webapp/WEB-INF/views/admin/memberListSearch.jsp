<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<fmt:requestEncoding value="utf-8" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원관리" name="title" />
</jsp:include>

<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/memberList.css">


<div id="commonMain">


	
	<section id="container">
	
		<div id="Tadminboard-submenu" class="submenu">
			
		</div>
		
		<div id="adminboard">
		
				<div id="adminboard-head">
					<h2>회원목록</h2>
				</div>

				<table>
					<thead id="list-head">
						<tr>
							<th>회원번호</th>
							<th>닉네임</th>
							<th>회원 이름</th>
							<th>회원 이메일</th>
							<th>회원 핸드폰번호</th>
							<th>탈퇴 여부</th>
						</tr>
					</thead>

					<tbody id="list-content">

						
							<tr>
								<td>${searchMember.MNo}</td>
								<td>${searchMember.MNickName}</td>
								<td>${searchMember.MName}</td>
								<td>${searchMember.MEmail}</td>
								<td>${searchMember.MPhone}</td>
								<td>
									<div id="btn-sort-wrap">
										<button type="submit" class="btn btn-primary"
											data-bs-target="#exampleModal"
											data-member-email=${searchMember.MEmail}
											id="deleteBtn">회원탈퇴</button>
									</div>
								</td>
							</tr>

					</tbody>
				</table>
						
					<div id="pagebar">
						<nav>${pagebar}</nav>
					</div>
	
						<div id="search-wrap">
							<form id="memberSearchBtn" action="${pageContext.request.contextPath}/admin/memberListSearch.do">
								<input type="text" id="memberSearchBtn" name="membername" placeholder="회원이름을 검색해보세요!" />
								<button type="submit" id="memberSearchBtn" class="btn">검색</button>
							</form>
							<button type="button" id="memberListBtn" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/memberList.do'">전체회원</button>
						</div>
		</div>
	</section>
</div>

<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

<script>

/* 회원 탈퇴 */
$(document).on('click', '#deleteBtn', function(){
	var memberEmail = $(this).data('memberEmail');
	console.log(memberEmail);
	
	if(confirm(memberEmail + "님을 탈퇴시키겠습니까?")){
		$.ajax({
			
			url : `${pageContext.request.contextPath}/admin/memeberDelete.do`,
			data : {
				memberEmail : memberEmail
			},
			contentType : 'application/jason;',
			type : "GET",
			success(response){
				console.log(response);
				alert(response.msg);
				location.href = `${pageContext.request.contextPath}/admin/memberList.do`;
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
	            alert("Status : " + textStatus);
	            alert("Error : " + errorThrown);
			}
		});
	} 
});

</script>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>