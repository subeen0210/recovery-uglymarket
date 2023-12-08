<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<form action="LoginPageC" method="post">
<h1>로그인 페이지</h1>
ID <br>
<input name="userID"> <br>
PW <br>
<input name="userPW" type="password"> <br>
<button>로그인</button>
<button type="button" onclick="location.href='regUserC'">회원가입</button>
</form>
</body>
</html>