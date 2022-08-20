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

<style>
.quickmenu {
	position: absolute;
	width: 90px;
	top: 50%;
	margin-top: -50px;
	right: 20px;
	background: #fff;
}

.quickmenu ul {
	position: relative;
	float: left;
	width: 100%;
	display: inline-block;
	*display: inline;
	border: 1px solid #ddd;
}

.quickmenu ul li {
	float: left;
	width: 100%;
	border-bottom: 1px solid #ddd;
	text-align: center;
	display: inline-block;
	*display: inline;
}

.quickmenu ul li a {
	position: relative;
	float: left;
	width: 100%;
	height: 30px;
	line-height: 30px;
	text-align: center;
	color: #999;
	font-size: 9.5pt;
}

.quickmenu ul li a:hover {
	color: #000;
}

.quickmenu ul li:last-child {
	border-bottom: 0;
}
</style>

	<!-- 
		side bar
	 -->

	<div class="quickmenu"
		style="position: absolute; right: 10px; top: 400px;">
		<ul>
			<li><a href="https://docs.google.com/forms/d/e/1FAIpQLSezP8AhwJtgqKQaRaCXSvznfgkgz40teH5CcDdINAhpoaSWcA/viewform?usp=sf_link">문의</a></li>
			<li><a href="${pageContext.request.contextPath}/chat/chatMainPage.do">채팅</a></li>
			<li><a href="#" onclick="window.scrollTo(0,0);">TOP</a></li>
		</ul>
	</div>

<div id="commonMain">
<!-- 
	생성 : 김용민
	작업 : 김용민, 이경석
 -->





	<div>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>내용<br>
</div>

</div>
<script src="${pageContext.request.contextPath}/resources/js/headerNavBar.js"></script>

<script>

// side bar

$(document).ready(function(){
	  $(window).scroll(function() {
	    var position = $(window).scrollTop() + 500; 
	    $(".quickmenu").stop().animate({"top":position+"px"},400);
	  });
	});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>