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
<div id="commonMain">

<!-- 
	생성 : 
	작업 : 
 -->
 	<h1>회원관리</h1>
 	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
    
     <table>
        <!-- <caption>Developers Rating</caption> -->
        <thead>
            <tr>
                <th>NO</th>
                <th>회원아이디</th>
                <th>이름</th>
                <th></th>
                <th>탈퇴</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td></td>
                <td>hoggd</td>
                <td>홍길동</td>
                <td></td>
                <td>
                  
                    <button class="delete">탈퇴</button>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>hoggd</td>
                <td>홍길동</td>
                <td></td>
                <td>
                  
                    <button class="delete">탈퇴</button>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>hoggd</td>
                <td>홍길동</td>
                <td></td>
                <td>
                  
                    <button class="delete">탈퇴</button>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>hoggd</td>
                <td>홍길동</td>
                <td></td>
                <td>
                  
                    <button class="delete">탈퇴</button>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>hoggd</td>
                <td>홍길동</td>
                <td></td>
                <td>
                  
                    <button class="delete">탈퇴</button>
                </td>
            </tr>

           
        </tbody>
        
    </table>

</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>