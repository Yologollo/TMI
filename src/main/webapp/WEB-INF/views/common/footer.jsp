<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!-- 
	생성 : 김용민
	작업 : 김용민
 -->
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
	}
	#footer2 {
		 background-color: lightblue;
		 height: 130px;
		 width: 100%;
		 color: white;
		 text-align: center;
	}
	#home, #github, #youtube {
		height: 100px;
	 	width: 100px;
	}
	#home {
		margin-left: 100px;
		margin-right: 100px;
	}
	</style>
	<div id="footer2">
		<img src="${pageContext.request.contextPath}/resources/images/github.png" alt="" id="github"/>
		<img src="${pageContext.request.contextPath}/resources/images/home.png" alt="" id="home"/>
		<img src="${pageContext.request.contextPath}/resources/images/youtube.png" alt="" id="youtube"/>
	</div>
	<div id="footer">
		<h6 style="font-size : 60px;">Travel Making Imagine</h6>
	</div>
	
</div>
<!-- 작업 : 최윤서 -->
<!-- HEADER MENU BAR JS -->
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
</body>
</html>
