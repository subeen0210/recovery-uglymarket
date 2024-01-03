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
	<div id="login-set-icon">
		<a class="nick" href="LoginPageC"><img style="width: 100px" src="lgh_account/loginButton/img/semi-login-icon.png"></a>
	</div>
	&emsp;&emsp; <img class="cart-icon" src="img/semi-cart-icon.png"
				onclick="userLoginCheck('${sessionScope.userAccount.u_id}')">
	&emsp;&emsp;
</body>
</html>