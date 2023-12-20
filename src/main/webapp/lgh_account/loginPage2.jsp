<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="wj/css/login.css" />
<link href="https://fonts.googleapis.com/css?family=Ubuntu"
	rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css" />
<title>Sign in</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="js/loginCheck.js"></script>
<script src="js/validCheck.js"></script>
</head>


<body>

	<div class="main">
		<p class="sign">Sign in</p>
		<form class="form1">
			<input class="un" placeholder="ID" name="userID" id="loginUserID" />
			<div class="emptyErrorMsg"><span id="loginEmptyID"></span></div>
			<input class="pass" type="password" placeholder="PW" name="userPW"
				id="loginUserPW" />
			<div class="emptyErrorMsg"><span id="loginEmptyPW"></span></div>
				<a class="submit"
				onclick="return loginCall()">ログイン</a><br /> <a class="submit"
				id="openModalBtn">ログイン&ensp;(販売者専用)</a>
			<p class="forgot">
				<a href="#">ID・パスワードを忘れた場合</a>
			</p>
		</form>
		<br> <br>
		<div class="reg-title">
			<span id="reg-title-text">アグリーマーケットが初めてですか？</span>
		</div>
		<div class="reg">
			<div onclick="location.href='RegUserC'" class="reg-personal">
				<img class="peronal-img" src="img/personal.png" alt="" /><br />個人向け
			</div>
			<div onclick="location.href='RegSellerC'" class="reg-business">
				<img class="business-img" src="img/celler.png" alt="" /><br />販売者向け
			</div>
		</div>
	</div>
	<!-- Dialog Element -->
	<dialog id="myModal">
	<div>
		<button id="closeModalBtn">&times;</button>
			<div>
				<div>
					<p>판매자님 환영합니다!</p>
				</div>
				<div>
					<div>Id</div>
					<div>
						<input name="sellerID" id="loginSellerID">
					</div>
				</div>
				<div>
					<div>PW</div>
					<div>
						<input name="sellerPW" id="loginSellerPW" type="password">
					</div>
					<p id="errorMessage2"></p>
				</div>
				<div>
					<button onclick="return loginSellerCall()">사업자 로그인</button>
				</div>
				<div>
					<a>id 비밀번호 찾기</a>
				</div>
			</div>
	</div>
	</dialog>
	
	<script>
		document.getElementById("openModalBtn").addEventListener("click",
				function() {
					// Open the dialog
					document.getElementById("myModal").showModal();
				});

		document.getElementById("closeModalBtn").addEventListener("click",
				function() {
					// Close the dialog
					document.getElementById("myModal").close();
				});
	</script>
</body>
</html>
