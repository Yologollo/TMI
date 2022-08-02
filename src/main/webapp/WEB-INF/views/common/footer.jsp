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
		height: 250px;
		width: 100%;
		color: white;
		padding-top: 2.5%;
		text-align:center;
	}
	#notion, #github, #youtube {
		height: 80px;
	 	width: 80px;
	}
	#logo {
		margin-left : -2%;
		margin-bottom : 1%;
		height: 150px;
	 	width: 160px;
	}
	#notion {
		margin-left: 25px;
		margin-right: 25px;
	}
	#github {
		margin-left: 12%;
	}
 	#line {
		width:800px;
		border:none; 
		border:0px;
		height:10px;
		margin:0 auto;
	}
	#title {
		font-size : 50px;
		
	}
	#title2 {
		margin-top : 5vh;
		margin-left : 12%;
	}
	</style>
	<div id="footer">
		<img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="" id="logo"/>
		<span id="title">TMI</span>
		<span>Travel Making Imagine</span>
		<span id="title2"> &#169; 2022. FINAL TEAM PROJECT : YOLO-GOLO</span>
		<img src="${pageContext.request.contextPath}/resources/images/github.png" alt="" id="github"/>
		<img src="${pageContext.request.contextPath}/resources/images/notion.png" alt="" id="notion"/>
		<img src="${pageContext.request.contextPath}/resources/images/youtube.png" alt="" id="youtube"/>
		
	</div>
	
</div>
</body>
</html>
