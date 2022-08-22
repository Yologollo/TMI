<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<fmt:requestEncoding value="utf-8" />


<jsp:include page="/WEB-INF/views/common/header.jsp"> 
	<jsp:param value="회원관리" name="title" />
</jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/memberList.css">

<div id="commonMain"> 
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



<div class="top-logo">
  <span>관리자</span>
</div>
<section id="container">
  <div id="Tadminboard-submenu" class="submenu">
  
	    <ul id="sub">
	      <li><a href="${pageContext.request.contextPath}/admin/memberList.do" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원목록</a></li>
	      <li><a href="${pageContext.request.contextPath}/admin/notice/noticeBoard.do" onmouseover="mousein(this);" onmouseout="mouseout(this)">공지사항</a></li>
	    </ul>
</div>
    
  <div id="adminboard">
    <div>
      <div id="adminboard-head">
      	<h2>공지사항</h2>
      	<div id="btn-sort-wrap">
          <input type="button" value="글쓰기" id="btn-add" class="btn btn-primary btn-lg" onclick="location.href='${pageContext.request.contextPath}/admin/notice/noticeBoardForm.do'"/>
        </div>
      </div>
      
      <table>
        <thead id="list-head">
          <tr>
	          	<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>첨부파일</th>
				<th>조회수</th>
          </tr>
        </thead>
         <tbody id="list-content">
        <c:forEach items="${list}" var="noticeBoard" varStatus="vs">
        <tr data-no="${noticeBoard.nb_no}">
					<td>${noticeBoard.nb_no}</td>
					<td>${noticeBoard.nb_title}</td>
					<td>${noticeBoard.m_nickname}</td>
					<td>
						<fmt:parseDate value="${noticeBoard.nb_created_at}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
						<fmt:formatDate value="${createdAt}" pattern="MM-dd HH:mm"/>
					</td>
					<td>
						<c:if test="${noticeBoard.attachCount gt 0}">
							<img src="${pageContext.request.contextPath}/resources/images/notice/file.png" width="16px" />
						</c:if>
					</td>
					<td>${noticeBoard.nb_read_count}</td>
				</tr>
			</c:forEach>
      	</table>
		<nav>${pagebar}</nav>
  </section>
		<br><br><br><br><br><br>
		<br><br><br><br><br><br>
		

</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>