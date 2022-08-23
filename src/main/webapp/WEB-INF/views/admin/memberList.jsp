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

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/memberList.css">


<div id="commonMain">
	
		<%-- <div id="Tadminboard-submenu" class="submenu">
			<ul id="sub">
				<li><a
					href="${pageContext.request.contextPath}/admin/memberList.do"
					onmouseover="mousein(this);" onmouseout="mouseout(this)">회원목록</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/notice/noticeBoard.do"
					onmouseover="mousein(this);" onmouseout="mouseout(this)">공지사항</a></li>
			</ul>
		</div> --%>
		



	<section id="container">
		<!-- <div id="Tadminboard-submenu" class="submenu">
			<ul id="sub">
				<li><a>
					</a></li>
				<li><a>
					</a></li>
			</ul>
		</div>
		 -->
		
			
		<div id="menuContainer">
   <ul>
      <li class="mypageMenuli">
         <a
					href="${pageContext.request.contextPath}/admin/memberList.do"
					onmouseover="mousein(this);" onmouseout="mouseout(this)">회원목록</a>
      </li>
      <hr />
      <li class="mypageMenuli">
         <a href="${pageContext.request.contextPath}/admin/notice/noticeBoard.do"
         onmouseover="mousein(this);" onmouseout="mouseout(this)">공지사항</a>
      </li>
      <hr />
     
     
   </ul>
</div>

	
		<!-- <div id="adminboard"> -->
		
				<div id="adminboard-head">
					<h2>회원목록</h2>
				<div id="search-wrap">
							<form id="memberSearchBtn" action="${pageContext.request.contextPath}/admin/memberListSearch.do">
								<input type="text" id="memberSearchBtn" name="membername" placeholder="회원이름을 검색해보세요!" />
								<button type="submit" id="memberSearchBtn" class="btn">검색</button>
							</form>
						</div>
				</div>
				<section id="board-container" class="container">
				<table id="notice-table-1" class="kakaobank-table" aria-describedby="kakaobank-notice-summary">
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









<%-- 
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
				</table> --%>
						
					<div id="pagebar">
						<nav>${pagebar}</nav>
					</div>
	
						
		</div>
	</section>
</div>



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

/* /* $(document).on('click', '#memberSearchBtn', function(){
	var memberName = $(this).data('memberName');
	console.log(memberName);

	
		$.ajax({
			
			url : `${pageContext.request.contextPath}/admin/memeberList.do`,
			data : {
				memberName : memberName
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
}); */ 



/* 	
function clickDel(formName) {
		formName.action = "/board/contentDelAsk";
		formName.method = "post";
		formName.submit();
	} 
*/
	
	
/* 
myModal.addEventListener('shown.bs.modal', function () {
  myInput.focus()
}) 
*/
</script>

<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>