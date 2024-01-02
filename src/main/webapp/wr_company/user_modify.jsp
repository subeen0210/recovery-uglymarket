<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="css/updateUser.css?ver=2.0" />
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/updateUser.js?ver=1.1"></script>
<script type="text/javascript" src="js/validCheck.js"></script>

</head>
<body>
	<form action="updateUserC" method="post" enctype="multipart/form-data"
		onsubmit="return userCheck()">
		<div class="reg-main">
			<div class="reg-container">
				<h1 style="color: #2a243a;">情報修正</h1>
				<br>
				<div id="imgShow">
					<img id="previewImg" src="lgh_account/userImg/${sessionScope.userAccount.u_img }">
				</div>
				<div class="reg-content">
					<div class="reg-menu">
						プロフィールイメージ<span class="essential-icon">*</span>
					</div>
					<div class="reg-input">
						<input class="input-style upload-img" placeholder="${sessionScope.userAccount.u_img }"
							readonly="readonly" /> <label for="fileInput">アップロード</label> <input
							type="file" name="userImg" id="fileInput"
							accept=".jpg, .jpeg, .png">
					</div>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-menu">ID</div>
					<div class="reg-input">${sessionScope.userAccount.u_id }</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">PW</div>
					<div class="reg-input">
						<a href="" title="Button border blue/green"
							class="btnBlueGreen-fade" id="password-change-button"
							type="button" onclick="return false;">パスワード変更</a>
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
						<button class="btn-style" style="cursor: pointer;">修正</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 비밀번호 찾기 modal -->
	<dialog id="password-modal">
	<div class="btn-size-close">
		<a id="close-button">X</a>
	</div>
	<div class="modal-content">
		<div class="content1">
			<div class="set-content1">現在パスワード</div>
			<br>
			<div class="set-content1">新たなパスワード</div>
			<br>
			<div class="set-content1">パスワード再確認</div>
		</div>
		<div class="content1">
			<div class="set-input">
				<input class="style-input" id="old-pw" type="password"
					placeholder="10字~20字">
				<div class="PW-change-errorMsg" id="PW-old-errorMsg"></div>
			</div>
			<br>
			<div class="set-input">
				<input class="style-input" id="new-pw" placeholder="10字~20字"
					type="password" maxlength="20">
				<div class="PW-change-errorMsg" id="pw-new-errorMsg"></div>
			</div>
			<br>
			<div class="set-input">
				<input class="style-input" id="new-pw-confirm" type="password"
					placeholder="再確認">
				<div class="PW-change-errorMsg" id="pwConfirm"></div>
			</div>
		</div>
	</div>
	<div>
		<a href="#" title="Button push blue/green"
			class="button btnPush btnBlueGreen"
			onclick="return passwordChange();">パスワード変更</a>
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

	document
			.getElementById("password-change-button")
			.addEventListener(
					"click",
					function() {
						// Open the dialog
						document.getElementById("password-modal").style.display = 'flex';
						document.getElementById("password-modal").showModal();
					});

	document
			.getElementById("close-button")
			.addEventListener(
					"click",
					function() {

						// Close the dialog
						document.getElementById("password-modal").style.display = 'none';
						document.getElementById("password-modal").close();
					});
</script>
<script type="text/javascript" src="js/imgShow.js"></script>
</html>

