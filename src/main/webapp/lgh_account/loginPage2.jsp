<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="wj/css/login.css" />
<link rel="stylesheet" href="css/loginPage2.css" />
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
			<div class="emptyErrorMsg">
				<span id="loginEmptyID"></span>
			</div>
			<input class="pass" type="password" placeholder="PW" name="userPW"
				id="loginUserPW" />
			<div class="emptyErrorMsg">
				<span id="loginEmptyPW"></span>
			</div>
			<a class="submit" onclick="return loginCall()">ログイン</a><br /> <a
				class="submit" id="openModalBtn">販売者専用</a>
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
	<div class="modal-size">
		<button id="closeModalBtn">&times;</button>
		<div>
			<div class="modal-title">
				<p>Sign in (販売者)</p>
			</div>
			<br>
			<div>
				<div class="un-set">
					<input class="un2" placeholder="ID" name="sellerID" id="loginSellerID">
				</div>
			</div>
			<br>
			<div>
				<div class="un-set">
					<input class="un2" placeholder="PW" name="sellerPW" id="loginSellerPW" type="password">
				</div>
				<p id="errorMessage2"></p>
			</div>
			<br>
			<div class="set-size">
				<button class="btn-set2" onclick="return loginSellerCall()">ログイン</button>
			</div>
			<br>
			<div class="set-size">
				<a>IDとパスワードを忘れましたか？</a>
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
		
		window.addEventListener("click", function(event) {
	        var modal = document.getElementById("myModal");
	        if (event.target == modal) {
	            modal.close();
	        }
	    });
	</script>
</body>
</html>
