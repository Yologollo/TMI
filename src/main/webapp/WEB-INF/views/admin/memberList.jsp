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
		<div id="menuContainer">
	  	  <ul>
		     <li class="mypageMenuli">
			  <a href="${pageContext.request.contextPath}/admin/memberList.do"onmouseover="mousein(this);" onmouseout="mouseout(this)">회원목록</a>
      		</li>
      		<hr />
      		
     			 <li class="mypageMenuli">
         			<a href="${pageContext.request.contextPath}/admin/notice/noticeBoard.do"onmouseover="mousein(this);" onmouseout="mouseout(this)">공지사항</a>
     			 </li>
  		    <hr />
 		   </ul>
		</div>

	
	
		<section id="board-container" class="container">
				<table id="notice-table-1" class="kakaobank-table" aria-describedby="kakaobank-notice-summary">
				<div id="adminboard-head">
					<h2>회원목록</h2>
					
				</div>
							<form id="memberSearchBtn" action="${pageContext.request.contextPath}/admin/memberListSearch.do">
								<input type="text" id="memberSearchBtn" name="membername" placeholder="회원이름을 검색해보세요!" />
								<button type="submit" id="ac-button.is-solid.is-primary" class="btn">검색</button>
							</form>
				
						
				         <colgroup>
				                <col width="10%">
				                <col width="">
				                <col width="20%">
				                <col width="20%">
				                <col width="10%">
				                <col width="10%">
				          </colgroup>
				          
				         <thead>
				            <tr>
					            <th scope="col" lang="en">No</th>
					            <th scope="col">닉네임</th>
					            <th scope="col">회원 이름</th>
					            <th scope="col">회원 이메일</th>
					            <th scope="col">회원 핸드폰번호</th>
					            <th scope="col">탈퇴여부</th>
				            </tr>
				         </thead>
				        <tbody id="list-content">

						<c:forEach items="${list}" var="adminList" varStatus="vs">
							<tr>
								<td>${adminList.m_no}</td>
								<td>${adminList.m_nickname}</td>
								<td>${adminList.m_name}</td>
								<td>${adminList.m_email}</td>
								<td>${adminList.m_phone}</td>
								<td>
									<div id="btn-sort-wrap">
										<button type="submit" class="btn btn-primary"
											data-bs-target="#exampleModal"
											data-member-email=${adminList.m_email
											}  	id="deleteBtn">회원탈퇴</button>
									</div>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				      </table>


				
						<nav>${pagebar}</nav>
				
	
						
		</div>
	</section>
	</section>
</div>


<!-- <script> -->

<script>
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