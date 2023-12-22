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
				<h1 style="color: #2a243a;">Sign up</h1>
				<br>
				<div class="reg-content">
					<div class="reg-menu">ID<span class="essential-icon">*</span></div>
					<div class="reg-input">
						<input class="input-style" name="userID" id="ID" maxlength="20" />&ensp;
						<button class="btn-style" type="button" id="checkDuplicate"
							value="users">重複確認</button>
						<div id="idStatusBox">
							<span id="idStatus"></span>
						</div>
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">パスワード<span class="essential-icon">*</span></div>
					<div class="reg-input">
						<input class="input-style" name="userPW" type="password"
							id="userPW" maxlength="20" />
							<div id="passWordEssential">
								※英語、数字、特殊文字を１つ以上組み合わせ10～20字で入力してください。
							</div>
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">パスワード再確認</div>
					<div class="reg-input">
						<input class="input-style" type="password" id="userPWconfirm"
							placeholder="もう一度記入してください" />&ensp; <span
							id="pwConfirm"></span>
					</div>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-name">お名前<span class="essential-icon">*</span></div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">姓</div>
					<div class="reg-input">
						<input class="input-style" name="userKanji_ln" placeholder="例）山田"/>
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">名</div>
					<div class="reg-input">
						<input class="input-style" name="userKanji_fn" placeholder="例）太郎"/>
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">セイ</div>
					<div class="reg-input">
						<input class="input-style" name="userKata_ln" placeholder="例）ヤマダ"/>
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">メイ</div>
					<div class="reg-input">
						<input class="input-style" name="userKata_fn" placeholder="例）タロウ"/>
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
					<div class="reg-name">電話番号<span class="essential-icon">*</span></div>
				</div>
				<div class="reg-content">
					<div class="reg-name">
						<input class="input-style3" name="userTel1" placeholder="012"/>&emsp;-&emsp;<input
						class="input-style3" name="userTel2" placeholder="3456"/>&emsp;-&emsp;<input
						class="input-style3" name="userTel3" placeholder="7890"/>
					</div>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-menu">メール<span class="essential-icon">*</span></div>
					<div class="reg-input">
						<input class="input-style" name="userEmail" type="email" />
					</div>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-name2">郵便番号<span class="essential-icon">*</span></div>
					<div class="reg-name3">
						<button class="btn-style" type="button" id="addr-popup">住所検索</button>
						<br />
					</div>
				</div>
				<br />
				<div class="reg-content">
					<div class="reg-menu">郵便番号</div>
					<div class="reg-input">
						<input class="input-style" name="userAddrN" id="addrNum"
							readonly="readonly" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">都道府県</div>
					<div class="reg-input">
						<input class="input-style" name="userAddrP" id="addrPrefecture"
							readonly="readonly" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">市区町村</div>
					<div class="reg-input">
						<input class="input-style" name="userAddrC" id="addrCity"
							readonly="readonly" />
					</div>
				</div>
				<div class="reg-content">
					<div class="reg-menu">詳細情報</div>
					<div class="reg-input">
						<input class="input-style" name="userAddrD" />
					</div>
				</div>
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
						<button class="btn-style">Sign Up</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript" src="js/regUser1.js"></script>
</html>

