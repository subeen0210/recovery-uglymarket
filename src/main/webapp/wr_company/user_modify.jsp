<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/regUser.css" />
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/addr.js"></script>
<script type="text/javascript" src="js/idCheck.js"></script>
<script type="text/javascript" src="js/validCheck.js"></script>
</head>
<body>
	<form action="RegUserC" method="post" enctype="multipart/form-data"
		onsubmit="return userCheck()">
		<div class="reg-main">
			<div class="reg-container">
				<h1 style="color: #2a243a;">情報修正</h1>
				<br>
				<div class="reg-content">
					<div class="reg-menu">ID</div>
					<div class="reg-input">
					AAAAAAAA
						
					</div>
				</div>
				<span id="idStatus"></span>
				<div class="reg-content">
					<div class="reg-menu">PW</div>
					<div class="reg-input">
						<input class="input-style" name="userPW" type="password"
							id="userPW" maxlength="20" /> <span id="pwStatus"></span>
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">PW Confirm</div>
					<div class="reg-input">
						<input class="input-style" type="password" id="userPWconfirm"
							placeholder="もう一度記入してください" />&ensp; <span
							id="pwConfirm"></span>
					</div>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-name">お名前</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">姓</div>
					<div class="reg-input">
						<input class="input-style" name="userKanji_ln" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">名</div>
					<div class="reg-input">
						<input class="input-style" name="userKanji_fn" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">セイ</div>
					<div class="reg-input">
						<input class="input-style" name="userKata_ln" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">メイ</div>
					<div class="reg-input">
						<input class="input-style" name="userKata_fn" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">ニックネーム</div>
					<div class="reg-input">
						<input class="input-style" name="userNicname" maxlength="10" />
					</div>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-name">電話番号</div>
				</div>
				<div class="reg-content">
					<div class="reg-name">
						<input class="input-style3" name="userTel1" />&emsp;-&emsp;<input
						class="input-style3" name="userTel2" />&emsp;-&emsp;<input
						class="input-style3" name="userTel3" />
					</div>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-menu">メール</div>
					<div class="reg-input">
						<input class="input-style" name="userEmail" type="email" />
					</div>
				</div>
				<br />
				
				<br />
				<div class="reg-content2">
					<div class="reg-name2">プロフィールイメージ</div>
					&ensp; <label for="fileInput">アップロード</label><input type="file"
						name="userImg" id="fileInput" onchange="displayFileName(this)" />
					<span id="fileNameDisplay"></span>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-name">
						<button class="btn-style">修正</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript" src="js/regUser.js"></script>
</html>

