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
		<span class="nick">${sessionScope.userAccount.u_nicname }様
			<img src="img/chevron.svg">
		</span>
		<div class="login-set-menus">
			<a class="login-set-menu" href="UserMypageC">MyPage</a>
			<a class="login-set-menu" href="SellerLoginC">Logout</a>
		</div>
	</div>
	&emsp;&emsp; <img class="cart-icon" src="img/semi-cart-icon.png"
				onclick="userLoginCheck('${sessionScope.userAccount.u_id}')">
	&emsp;&emsp;
</body>
</html>