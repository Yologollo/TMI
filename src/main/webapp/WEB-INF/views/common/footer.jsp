<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!-- 
	생성 : 김용민
	작업 : 김용민
 -->
 	<!-- 작업 : 이경석 -->
	<!-- footer -->
		</section>
	</main>
	
	<style>
	#footer {
		 background-color: blue;
		 height: 500px;
		 width: 100%;
		 color: white;
		 padding-top:40px;
		 text-align: center;
		 vertical-align: middle;
	}
	#footer2 {
		 background-color: lightblue;
		 height: 130px;
		 width: 100%;
		 color: white;
		 text-align: center;
		 vertical-align: middle;
	}
	#home, #github, #youtube {
		margin-top:15px;
		height: 100px;
	 	width: 100px;
	}
	#logo {
		height: 230px;
	 	width: 240px;
	}
	#home {
		margin-left: 150px;
		margin-right: 150px;
	}
 	#line {
		width:800px;
		border:none; 
		border:0px;
		height:10px;
		margin:0 auto;
	}
	</style>
	<div id="footer2">
		<img src="${pageContext.request.contextPath}/resources/images/github.png" alt="" id="github"/>
		<img src="${pageContext.request.contextPath}/resources/images/home.png" alt="" id="home"/>
		<img src="${pageContext.request.contextPath}/resources/images/youtube.png" alt="" id="youtube"/>
	</div>
	<div id="footer">
		<h6 style="font-size : 60px;">Travel Making Imagine</h6>
		<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="" id="logo"/>
		<h6>서울특별시 강남구 테헤란로</h6>
		<h6>010-0000-0000</h6>
	</div>
	
</div>
<!-- 작업 : 최윤서 -->
<!-- HEADER MENU BAR JS -->
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
</body>
</html>
