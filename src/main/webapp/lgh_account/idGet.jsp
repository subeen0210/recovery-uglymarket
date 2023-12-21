<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="result" items="${emails }" >
	${result } <br>
	</c:forEach>
	${resultMsg } <br>
	<button>로그인하기</button>
	<button>비밀번호찾기</button>
</body>
</html>