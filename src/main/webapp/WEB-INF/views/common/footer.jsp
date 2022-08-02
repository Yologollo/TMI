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
		background: #c2e59c; 
		background: -webkit-linear-gradient(to right, #64b3f4, #c2e59c);  
		background: linear-gradient(to right, #64b3f4, #c2e59c);
		height: 200px;
		width: 100%;
		color: white;
		padding-top:40px;
		text-align:center;
	}
	#home, #github, #youtube {
		height: 50px;
	 	width: 50px;
	}
	#logo {
		height: 150px;
	 	width: 160px;
	}
	#home {
		margin-left: 10px;
		margin-right: 10px;
	}
	#github {
		margin-left: 5%;
	}
 	#line {
		width:800px;
		border:none; 
		border:0px;
		height:10px;
		margin:0 auto;
	}
	#title {
		font-size : 40px;
		margin-left : 5%;
	}
	</style>
	<div id="footer">
		<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="" id="logo"/>
		<span id="title">Travel Making Imagine</span>
		<img src="${pageContext.request.contextPath}/resources/images/github.png" alt="" id="github"/>
		<img src="${pageContext.request.contextPath}/resources/images/home.png" alt="" id="home"/>
		<img src="${pageContext.request.contextPath}/resources/images/youtube.png" alt="" id="youtube"/>
	</div>
	
</div>
</body>
</html>
