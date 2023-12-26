<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="wj/css/findResult.css" />
</head>
<body>
	<div class="main">
		<div class="find-Id">一時パスワードを作成します</div>
		<br>
		<br>
		<div class="result-font">
		<c:choose>
			<c:when test="${randomPassword != null} ">
				${randomPassword }
			</c:when>
			<c:otherwise>
				${resultMsg }
			</c:otherwise>
		</c:choose>
		
		</div>
		<br>
		<br>
		<div class="btn-position">
			<div class="set-btn">
				<a href="" title="Button push blue/green"
					class="button btnPush btnBlueGreen">Login</a>
			</div>
			<div class="set-btn">
				<a href="" title="Button push blue/green"
					class="button btnPush btnBlueGreen">IDを探す</a>
			</div>
		</div>
	</div>
</body>
</html>