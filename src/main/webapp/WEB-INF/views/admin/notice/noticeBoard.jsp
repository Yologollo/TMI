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
	<jsp:param value="공지사항" name="title" />
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberList.css">

<style>
tr[data-no] {
	cursor: pointer;
}
</style>
<script>
window.addEventListener('load', (e) => {
	document.querySelectorAll("tr[data-no]").forEach((tr) => {
		tr.addEventListener('click', (e) => {
			console.log(e.target);
			const tr = e.target.parentElement;
			console.log(tr);
			// 특정 선택자 일치 여부
			if(tr.matches('tr[data-no]')) {
				const no = tr.dataset.no;
				location.href = '${pageContext.request.contextPath}/admin/notice/noticeBoardDetail.do?no=' + no;
			}
		});
	});
});
</script>

<div class="intro_top">
	<img src="${pageContext.request.contextPath}/resources/images/planner/plannerBanner.gif"/>
</div>
<div id="commonMain" style="margin-top: 0;">
		<div id="menuContainer">
			<ul>
				<sec:authorize access="hasRole('ADMIN')">
					<li class="mypageMenuli">
						<li>
							<a href="${pageContext.request.contextPath}/admin/memberList.do"onmouseover="mousein(this);" onmouseout="mouseout(this)">회원목록</a>
						</li>
					</li>
				<hr />
				</sec:authorize>
					<li class="mypageMenuli">
						<a href="${pageContext.request.contextPath}/admin/notice/noticeBoard.do"onmouseover="mousein(this);" onmouseout="mouseout(this)">공지사항</a>
					</li>
				<hr />
			</ul>
		</div>


	<section id="board-container" <%-- class="container" --%>>
			<h1>공지사항</h1>
			<table id="notice-table-1" class="kakaobank-table" aria-describedby="kakaobank-notice-summary">
				<div id="adminboard-head">
				</div>
				<sec:authorize access="hasRole('ADMIN')">
					<button class="ac-button is-md is-solid is-primary search-form__search e-search-posts" onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeBoardForm.do'">글쓰기</button>
				</sec:authorize>
								
				<colgroup>
	                <col width="10%">
	                <col width="10%">
	                <col width="20%">
	                <col width="20%">
	                <col width="10%">
	                <col width="10%">
          		</colgroup>
	          		
         		<thead>
            		<tr>
			            <th scope="col" lang="en">No</th>
			            <th scope="col">제목</th>
			            <th scope="col">작성자</th>
			            <th scope="col">등록일</th>
			            <th scope="col">첨부파일</th>
			            <th scope="col">조회수</th>
           			</tr>
	       		 </thead>
	       		 
	         <tbody>
        			 <c:forEach items="${list}" var="noticeBoard" varStatus="vs">
							<tr data-no="${noticeBoard.nb_no}">
								<td>${noticeBoard.nb_no}</td>
								<td>${noticeBoard.nb_title}</td>
								<td>${noticeBoard.m_nickname}</td>
								<td><fmt:parseDate value="${noticeBoard.nb_created_at}"
										pattern="yyyy-MM-dd'T'HH:mm" var="createdAt" /> <fmt:formatDate
										value="${createdAt}" pattern="MM-dd HH:mm" /></td>
								<td>	<c:if test="${noticeBoard.attachCount gt 0}">
											<img src="${pageContext.request.contextPath}/resources/images/notice/file.png" width="16px" />
										</c:if>
								</td>
								<td>${noticeBoard.nb_read_count}</td>
							</tr>
						</c:forEach>
						</tbody>	
				</table>
				<nav>${pagebar}</nav>
         
			</div>
	</section>
</div>


<!-- <script> -->

<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>