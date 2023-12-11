<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>mypage main</h2>
	
	
	<div>
		<span onclick="location.href='ItemAddC'"> 상품 등록 </span>
	</div>
	
	
	<jsp:include page="${mypageContent }"></jsp:include>
	

</body>
</html>