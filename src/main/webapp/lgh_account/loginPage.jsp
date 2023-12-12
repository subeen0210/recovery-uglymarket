<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<form action="LoginPageC" method="post">
		<h1>로그인 페이지</h1>
		ID <br> <input name="userID"> <br> PW <br> <input
			name="userPW" type="password"> <br>
		<button>로그인</button>
		<button type="button" onclick="location.href='RegUserC'">소비자 회원가입</button>
		<button type="button" onclick="location.href='RegSellerC'">판매자 회원가입</button>
	</form>
	<span id="openModalBtn" style="cursor: pointer;">사업자 로그인</span>
	<!-- Dialog Element -->
	<dialog id="myModal">
	<div>
		<button id="closeModalBtn">&times;</button>
		<form action="SellerLoginC" method="post">
					<div>
						<div>
							<p>사업자님 환영합니다!</p>
						</div>
						<div>
							<div>Id</div>
							<div>
								<input name="sellerID">
							</div>
						</div>
						<div>
							<div>PW</div>
							<div>
								<input name="sellerPW">
							</div>
						</div>
						<div>
							<button>사업자 로그인</button>
						</div>
					</div>
				</form>
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