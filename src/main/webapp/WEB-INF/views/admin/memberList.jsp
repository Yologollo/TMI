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
	생성 : 
	작업 : 
 -->
 	<!-- <h1>회원관리</h1> -->
 
<div class="top-logo">
  <span>회원관리</span>
</div>
<section id="container">
  <div id="Tadminboard-submenu" class="submenu">
  
	    <ul id="sub">
	      <li><a href="" onmouseover="mousein(this);" onmouseout="mouseout(this)">회원목록</a></li>
	      <li><a id="now_menu" class="current" onmouseover="mousein(this);" onmouseout="mouseout(this)">공지사항</a></li>
	      </li>
	    </ul>

    
  </div>
  <div id="adminboard">
    <div>
      <div id="adminboard-head">
      	<h2>회원목록</h2>
        <div id="btn-sort-wrap">
          <button onclick="deleteBoard();">삭제</button>
          
        </div>
      </div>
      
      <table>
        <thead id="list-head">
          <tr>
          	<th></th>
            <th>회원아이디</th>
            <th>회원별명</th>
            <th>회원이름</th>
          </tr>
        </thead>
        <tbody id="list-content">
         <td><input type="checkbox" ></td>
         <td>hogged</td>
         <td>홍쥐디</td>
         <td>홍길동</td>
       <%--  <%
			for(int i = 0; i < list.size(); i++){ 
		%> --%>
       <%--    코드 수정하기!!!!!!!! ㅋㅋㅋㅋ
        <tr class="" id="tr<%= list.get(i).getNo() %>" >
          	<td><input type="checkbox" name="ck" class="ckbox" id="ck<%= list.get(i).getNo() %>" value="<%= list.get(i).getNo() %>"></td>
            <td><%= list.get(i).getNo() %></td>
            <td><a href="<%= request.getContextPath() %> memberlist <%= list.get(i).getNo() %>"><%= list.get(i).getTitle() %></a></td>
            
          </tr>
  			<% 	} %>
  			 --%>
  			</tbody>
      	</table>
		

      <div id="search-wrap">
        <input type="text" id="search" name="search" placeholder="회원을 검색해보세요!"/>
        <button type="button" onclick="searchMember();" id="btn" class="btn">검색</button>
      </div> 
    </div>
	<div id="pagebar">
	<%-- 	<%= pagebar %> --%>
	</div>
  </div>

 
</section>
 	
    </table>
    
    
</body>
 	 
</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>