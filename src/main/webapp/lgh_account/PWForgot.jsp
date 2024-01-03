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
		<input type="hidden" name="personCheck" value="user">
		<div class="main2">
			<a href="HC"><img id="homeImg" src="img/home_icon_login.svg"></a>
			<div class="find-Id">パスワードを探す</div>
			<br> <br>
			<div class="set-size">
				<div class="set-name">ID</div>
				<div class="set-input">
					<input class="style-input" name="id" placeholder="ID">
				</div>
			</div>
			<div class="set-size">
				<div class="set-name">姓</div>
				<div class="set-input">
					<input class="style-input" name="kanji_ln" placeholder="First-name">
				</div>
			</div>
			<div class="set-size">
				<div class="set-name">名</div>
				<div class="set-input">
					<input class="style-input" name="kanji_fn"
						placeholder="Second-name">
				</div>
			</div>
			<div class="set-size">
				<div class="set-name">イーメール</div>
				<div class="set-input">
					<input class="style-input" name="email" placeholder="Email">
				</div>
			</div>
			<div class="set-btn">
				<button title="Button push blue/green"
					class="button btnPush btnBlueGreen">探す</button>
			</div>
			<br> <br>
			<div class="menu align-center expanded text-center SMN_effect-23">
				<a href="RegUserC" data-hover="Sign up">Sign up</a> <a
					href="IDForgotC?button=user" data-hover="IDを探す">IDを探す</a> <a
					href="LoginPageC" data-hover="Sign in">Sign in</a>
				<!-- data-hover : hover했을때 내려오는 글자 -->
			</div>
		</div>
	</form>
</body>
</body>
</html>