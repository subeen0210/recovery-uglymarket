<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="js/loginCheck.js" ></script>
<script src="js/validCheck.js" ></script>
</head>
<body>
	<a href="HC"><img src="img/semi-logo-img.png"><img
		src="img/semi-logo-title.png"></a>
		<div>
			<div>로그인 페이지</div>
			<div>ID</div>
			<div>
				<input name="userID" id="loginUserID">
				<p id="loginEmptyID"></p>
			</div>
			<div>PW</div>
			<div>
				<input name="userPW" id="loginUserPW" type="password"> <br>
				<p id="loginEmptyPW"></p>
				<p id="errorMessage"></p>
			</div>
			<div>
				<button type="button" onclick="return loginCall()">로그인</button>
				
			</div>
		</div>
		<button type="button" onclick="location.href='RegUserC'">소비자
			회원가입</button>
		<button type="button" onclick="location.href='RegSellerC'">판매자
			회원가입</button>
	<span id="openModalBtn" style="cursor: pointer;">사업자 로그인</span>
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