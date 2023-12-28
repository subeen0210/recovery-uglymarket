<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="wr_company/MYPAGE_NEW/css/updateSeller.css" />
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/addr.js"></script>
<script type="text/javascript" src="js/updateUser.js"></script>
<script type="text/javascript" src="js/validCheck.js"></script>
</head>
<body>

	<form action="updateSellerC" method="post"
		enctype="multipart/form-data" onsubmit="return sellerCheck()">
		<div class="reg-main">
			<div class="reg-container">
				<h1 style="color: #2a243a">情報修正</h1>
				<br />
				<div class="reg-content">
					<div class="reg-menu">ID</div>
					<div class="reg-input">
						<span>${sessionScope.sellerAccount.s_id }</span>
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">パスワード</div>
					<div class="reg-input">
						<a href="" title="Button border blue/green"
							class="btnBlueGreen-fade" id="password-change-button"
							type="button" href="#" onclick="return false;">パスワード変更</a>
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
						<input class="input-style" name="sellerKanji_ln"
							value="${sessionScope.sellerAccount.s_kanji_ln }" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">名</div>
					<div class="reg-input">
						<input class="input-style" name="sellerKanji_fn"
							value="${sessionScope.sellerAccount.s_kanji_fn }" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">セイ</div>
					<div class="reg-input">
						<input class="input-style" name="sellerKata_ln"
							value="${sessionScope.sellerAccount.s_kata_ln }" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">メイ</div>
					<div class="reg-input">
						<input class="input-style" name="sellerKata_fn"
							value="${sessionScope.sellerAccount.s_kata_fn }" />
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
						<input class="input-style3" name="sellerTel1" />&emsp;-&emsp;<input
							class="input-style3" name="sellerTel2" />&emsp;-&emsp;<input
							class="input-style3" name="sellerTel3" />
					</div>
				</div>
				<br />
				<div class="reg-content2">
					<div class="reg-name2">
						農場イメージ<span class="essential-icon">*</span>
					</div>
					&ensp; <label for="fileInput">アップロード</label><input type="file"
						name="newFarmImg" id="fileInput" onchange="displayFileName(this)" />
					<span id="fileNameDisplay"></span>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-menu">
						農場名<span class="essential-icon">*</span>
					</div>
					<div class="reg-input">
						<input class="input-style" name="farmName"
							value="${sessionScope.sellerAccount.s_Fname }" maxlength="10" />
					</div>
				</div>
				<br />
				<div class="reg-content3">
					<div class="reg-menu">農場説明</div>
					<div class="reg-input2">
						<textarea class="input-style2" name="farmStory" id="farmStory"
							cols="30" rows="10"></textarea>
					</div>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-name2">
						農場 郵便番号<span class="essential-icon">*</span>
					</div>
					<div class="reg-name3">
						<button class="btn-style" type="button" id="addr-popup">
							住所検索</button>
						<br />
					</div>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-menu">郵便番号</div>
					<div class="reg-input">
						<input class="input-style" name="sellerAddrN" id="addrNum"
							readonly="readonly" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">都道府県</div>
					<div class="reg-input">
						<input class="input-style" name="sellerAddrP" id="addrPrefecture"
							readonly="readonly" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">市区町村</div>
					<div class="reg-input">
						<input class="input-style" name="sellerAddrC" id="addrCity"
							readonly="readonly" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">詳細情報</div>
					<div class="reg-input">
						<input class="input-style" name="sellerAddrD" />
					</div>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-name">
						<button class="btn-style">変更</button>
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
				<input class="style-input" id="old-pw" type="password" placeholder="10字~20字">
				<div class="PW-change-errorMsg" id="PW-old-errorMsg"></div>
			</div>
			<br>
			<div class="set-input">
				<input class="style-input" id="new-pw" placeholder="10字~20字" type="password" maxlength="20">
				<div class="PW-change-errorMsg" id="pw-new-errorMsg"></div>
			</div>
			<br>
			<div class="set-input">
				<input class="style-input" id="new-pw-confirm" type="password" placeholder="再確認">
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
<script type="text/javascript" src="js/regUser1.js"></script>
<script type="text/javascript">
	$(function() {
		// 전화번호 분리를 위해 적었습니다. 다른 js로 넣으면 깨지니까 여기서 작업해주세요
		let telValue = "${sessionScope.sellerAccount.s_tel }";
		console.log(telValue);

		let telParts = telValue.split("-");

		// 분리된 부분을 각 입력 필드에 할당합니다.
		document.querySelector("input[name='sellerTel1'").value = telParts[0];
		document.querySelector("input[name='sellerTel2'").value = telParts[1];
		document.querySelector("input[name='sellerTel3'").value = telParts[2];
		/* 분리 끝 */

		// 농장 주소 분리를 위해 적었습니다.
		let addrValue = "${sessionScope.sellerAccount.s_Faddr }";
		console.log(addrValue);

		let addrParts = addrValue.split("!");

		document.querySelector("input[name='sellerAddrN'").value = addrParts[0];
		document.querySelector("input[name='sellerAddrP'").value = addrParts[1];
		document.querySelector("input[name='sellerAddrC'").value = addrParts[2];
		document.querySelector("input[name='sellerAddrD'").value = addrParts[3];
		/* 분리 끝 */

		// 스토리 부분 <br>을 \r\n으로 바꾸기 위해 작성했습니다.
		let storyValue = "${sessionScope.sellerAccount.s_Fstory }";
		let storyreplace = storyValue.replace(/<br>/g, '\r\n');
		console.log(storyreplace);

		document.querySelector('#farmStory').value = storyreplace;

		/* 분리 끝 */

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
</html>
