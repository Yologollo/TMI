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
<!-- 
	생성 : 권민지
	작업 : 권민지
 -->

<div class="top-logo">
  <span>공지사항</span>
</div>
<section id="container">
  <div id="Tadminboard-submenu" class="submenu">
  
	    <ul id="sub">
	      <li><a href="${pageContext.request.contextPath}/admin/memberList.do" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원목록</a></li>
	      <li><a href="${pageContext.request.contextPath}/admin/noticeList" onmouseover="mousein(this);" onmouseout="mouseout(this)">공지사항</a></li>
	      
	    </ul>
</div>
  <div id="adminboard">
    <div>
      <div id="adminboard-head">
      	<h2>공지사항</h2>
      	<div id="btn-sort-wrap">
          <button onclick="">추가하기</button>
        </div>
      </div>
      
      <table>
        <thead id="list-head">
          <tr>
          	<th></th>
            <th>관리자</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
         <tbody id="list-content">
         <td><input type="checkbox" ></td>
         <td>hogged</td>
         <td>홍쥐디</td>
         <td>홍길동</td>
        	</tbody>
      	</table>

		<br><br><br><br><br><br>
		<br><br><br><br><br><br>
		<br><br><br>
		
</section>

</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>