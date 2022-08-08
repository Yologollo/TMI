<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사이드 바</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidebar.css">
</head>
<body>
    <div class="menu">
       <ul>
        <li><a href="#" class="item" onclick="javascript:window.scrollTo(0,0)"></a></li>
        <li><a href="#" class="item" onclick="location.href='${pageContext.request.contextPath}/board/planner/plannerBoard.do'"></a></li>
        <li><a href="#" class="item" onclick="location.href='${pageContext.request.contextPath}/board/planner/plannerBoard.do'"></a></li>
        <li><a href="#" class="item" onclick="location.href='${pageContext.request.contextPath}/board/planner/plannerBoard.do'"></a></li>
    </ul>
</div>

    
</body>
</html>