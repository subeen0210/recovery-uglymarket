<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/loginForgot.css" />
</head>
<body>
<body>
	<form action="PWForgotC" method="post">
		<div class="main2">
			<div class="find-Id">パスワードを探す</div>
			<br> <br>
			<div class="set-size">
				<div class="set-name">ID</div>
				<div class="set-input">
					<input class="style-input" placeholder="ID">
				</div>
			</div>
			<div class="set-size">
				<div class="set-name">姓</div>
				<div class="set-input">
					<input class="style-input" placeholder="First-name">
				</div>
			</div>
			<div class="set-size">
				<div class="set-name">名</div>
				<div class="set-input">
					<input class="style-input" placeholder="Second-name">
				</div>
			</div>
			<div class="set-size">
				<div class="set-name">イーメール</div>
				<div class="set-input">
					<input class="style-input" name="email" placeholder="Email">
				</div>
			</div>
			<div class="set-btn">
				<a href="" title="Button push blue/green"
					class="button btnPush btnBlueGreen">探す</a>
			</div>
			<br> <br>
			<div class="menu align-center expanded text-center SMN_effect-23">
				<a href="" data-hover="Sign up">Sign up</a> 
				<a href="IDForgotC" data-hover="IDを探す">IDを探す</a> 
					<a href="" data-hover="Sign in">Sign
					in</a>
				<!-- data-hover : hover했을때 내려오는 글자 -->
			</div>
		</div>
	</form>
</body>
</body>
</html>