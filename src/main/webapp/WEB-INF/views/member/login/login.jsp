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
<div id="commonMain">
<!-- 
	생성 : 김용민
	작업 : 김용민
 -->
 	<h1>로그인</h1>
 	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
<script>
$(document).ready(function (){
	$('.nav_link').addClass('nav_color_b');
	$('#title_img').attr('src','${pageContext.request.contextPath}/resources/images/title_blue.png')
	$(window).on('scroll', function(){
		if(this.scrollY >= 0) {
			$('.nav_link').addClass('nav_color_b');
			$('#title_img').attr('src','${pageContext.request.contextPath}/resources/images/title_blue.png')
		}
	});
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>