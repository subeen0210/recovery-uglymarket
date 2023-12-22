<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/updateUser.css" />
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/updateUser.js"></script>
<script type="text/javascript" src="js/validCheck.js"></script>

</head>
<body>
	<form action="updateUserC" method="post" enctype="multipart/form-data"
		onsubmit="return userCheck()">
		<div class="reg-main">
			<div class="reg-container">
				<h1 style="color: #2a243a;">情報修正</h1>
				<br>
				<div class="reg-content2">
					<div class="reg-name2">プロフィールイメージ</div>
					&ensp; <label for="fileInput">アップロード</label><input type="file"
						name="userImg" id="fileInput" onchange="displayFileName(this)" />
					<span id="fileNameDisplay"></span>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-menu">ID</div>
					<div class="reg-input">${sessionScope.userAccount.u_id }</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">PW</div>
					<div class="reg-input">
						<a id="password-change-button" type="button"
							href="#" onclick="return false;">パスワード変更</a>
					</div>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-name">
						お名前<span class="essential-icon">*</span>
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">姓</div>
					<div class="reg-input">
						<input class="input-style" name="userKanji_ln"
							value="${sessionScope.userAccount.u_kanji_ln }" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">名</div>
					<div class="reg-input">
						<input class="input-style" name="userKanji_fn"
							value="${sessionScope.userAccount.u_kanji_fn }" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">セイ</div>
					<div class="reg-input">
						<input class="input-style" name="userKata_ln"
							value="${sessionScope.userAccount.u_kata_ln }" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">メイ</div>
					<div class="reg-input">
						<input class="input-style" name="userKata_fn"
							value="${sessionScope.userAccount.u_kata_fn }" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">ニックネーム</div>
					<div class="reg-input">
						<input class="input-style" name="userNickname"
							value="${sessionScope.userAccount.u_nicname }" maxlength="10" />
					</div>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-name">
						電話番号<span class="essential-icon">*</span>
					</div>
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
					<div class="reg-menu">
						メール<span class="essential-icon">*</span>
					</div>
					<div class="reg-input">
						<input class="input-style"
							value="${sessionScope.userAccount.u_email }" name="userEmail"
							type="email" />
					</div>
				</div>
				<br /> <br />
				<div class="reg-content">
					<div class="reg-name">
						<button class="btn-style">修正</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 비밀번호 찾기 modal -->
	<dialog id="password-modal" style="width: 500px; height: 500px;">
	<div>
		<a id="close-button">X</a>
	</div>
	<div>
		<div>
			<span>現在パスワード</span> <input id="old-pw" type="password">
		</div>
		<div>
			<span>新たなパスワード</span> <input id="new-pw" type="password">
		</div>
		<div>
			<span>パスワード再確認</span> <input type="password">
		</div>
	</div>
	<div>
		<a href="#" onclick="return passwordChange();">パスワード変更</a>
	</div>
	</dialog>
	<!-- 비밀번호 찾기 modal 끝 -->
</body>
<script type="text/javascript">
	$(function() {
		// 전화번호 분리를 위해 적었습니다. 다른 js로 넣으면 깨지니까 여기서 작업해주세요
		let telValue = "${sessionScope.userAccount.u_tel}";
		console.log(telValue);

		let telParts = telValue.split("-");

		// 분리된 부분을 각 입력 필드에 할당합니다.
		document.querySelector("input[name='userTel1'").value = telParts[0];
		document.querySelector("input[name='userTel2'").value = telParts[1];
		document.querySelector("input[name='userTel3'").value = telParts[2];
	});

	document.getElementById("password-change-button").addEventListener("click",
			function() {
				// Open the dialog
				document.getElementById("password-modal").showModal();
			});

	document.getElementById("close-button").addEventListener("click",
			function() {

				// Close the dialog
				document.getElementById("password-modal").close();
			});
</script>
<script type="text/javascript" src="js/regUser1.js"></script>
</html>

