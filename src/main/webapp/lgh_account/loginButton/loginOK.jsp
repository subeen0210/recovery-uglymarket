<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/loginOk.css" />
</head>
<body>
	<div class="login-set">
		<span class="nick">${sessionScope.userAccount.u_nicname }様</span>
		<button onclick="location.href='SellerLoginC'">logout</button>
		<button>myPage</button>
	</div>
</body>
</html>