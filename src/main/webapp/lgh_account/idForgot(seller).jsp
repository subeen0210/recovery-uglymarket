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
	<form action="IDForgotC" method="post">
		<input type="hidden" name="personCheck" value="seller">
		<div class="main">
			<a href="HC"><img id="homeImg" src="img/home_icon_login.svg"></a>
			<div class="find-Id">IDを探す(事業者)</div>
			<br> <br>
			<div class="set-size">
				<div class="set-name">姓</div>
				<div class="set-input">
					<input class="style-input" name="f_name" placeholder="First-name">
				</div>
			</div>
			<div class="set-size">
				<div class="set-name">名</div>
				<div class="set-input">
					<input class="style-input" name="s_name" placeholder="Second-name">
				</div>
			</div>
			<div class="set-size">
				<div class="set-name">携帯番号</div>
				<div class="set-input">
					<input class="style-input" name="tel" placeholder="Phone-number">
					<span class="pn-info">※&ensp;<span style="color: red;">ーなしで</span>入力してください</span>
				</div>
			</div>
			<div class="set-btn">
				<button title="Button push blue/green"
					class="button btnPush btnBlueGreen">探す</button>
			</div>
			<br>
			<br>
			<div class="menu align-center expanded text-center SMN_effect-23">
				<a href="RegSellerC" type="button" data-hover="Sign up">Sign up</a> <a
					href="PWForgotC?button=seller" type="button" data-hover="パスワードを探す">パスワードを探す</a> <a
					href="LoginPageC" type="button" data-hover="Sign in">Sign in</a> <!-- 컨트롤러 새로 만들어서 적용 잊지 않기! -->
				<!-- data-hover : hover했을때 내려오는 글자 -->
			</div>
		</div>
	</form>
</body>
</html>