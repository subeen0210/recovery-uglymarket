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
	
	<form action="MypageC" method="post" enctype="multipart/form-data">
	<div>
		<span> 상품 등록 </span>
	</div>
	</form>

	<jsp:include page="${mypageContent }"></jsp:include>

</body>
</html>