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
 	<!-- <h1>회원관리</h1> -->
 
<div class="top-logo">
  <span>관리자</span>
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
      	<h2>회원목록</h2>
        <!-- <div id="btn-sort-wrap">
          <button onclick="deleteBoard();">삭제</button>
        </div> -->
      </div>
      
      <table>
        <thead id="list-head">
          <tr>
          	<th></th>
            <th>회원번호</th>
            <th>회원별명</th>
            <th>회원이름</th>
          </tr>
        </thead>
        <tbody id="list-content">
        <td></td>
         <td>hogged</td>
         <td>홍쥐디</td>
         <td>홍길동</td>
         <td>
           <div id="btn-sort-wrap">
             <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">회원탈퇴</button>
           </div>
        </td>
        
        <!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5>회원탈퇴</h5> 
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        회원을 정말 탈퇴시키겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary">탈퇴하기</button>
		      </div>
		    </div>
		  </div>
		</div>

        
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
		<%-- <%= pagebar %>  --%>
	</div>
  </div>

 
</section>
 	
    </table>
    
    

 	 
</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>


<script>
/* 	function clickDel(formName) {
		formName.action = "/board/contentDelAsk";
		formName.method = "post";
		formName.submit();
	} */
	
	
	myModal.addEventListener('shown.bs.modal', function () {
	  myInput.focus()
	})
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>