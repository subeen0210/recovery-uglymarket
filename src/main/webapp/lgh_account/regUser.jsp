<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="../css/regUser.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<div>
			<div>
				<h1>회원가입</h1>
			</div>
			<div class="container">
				<div>
					<div>ID</div>
					<div>
						<input name="userID" id="ID" maxlength="20">
						<button type="button" id="checkDuplicate" value="users">重複確認</button>
						<span id="idStatus"></span>
					</div>
				</div>
				<div>
					<div>パスワード</div>
					<div>
						<input name="userPW" type="password" id="userPW" maxlength="20">
						<br> <span id="pwStatus"></span> <input type="password"
							id="userPWconfirm" placeholder="もう一度記入してください"> <span
							id="pwConfirm"></span>
					</div>
				</div>
				<div>
					<div>お名前</div>
					<div>
						<div>姓</div>
						<input name="userKanji_ln">
					</div>
					<div>
						
						<div>名</div>
						<input name="userKanji_fn">
					</div>
					<div>
						<div>セイ</div>
						<input name="userKata_ln">
					</div>
					<div>
						<div>メイ</div>
						<input name="userKata_fn">
					</div>
				</div>
				<div>
					<div>ニックネーム</div>
					<div>
						<input name="userNicname" maxlength="10">
					</div>
				</div>
				<div>
					<div>電話番号</div>
					<div>
						<input name="userTel1">-<input name="userTel2">-<input
							name="userTel3">
					</div>
				</div>
				<div>
					<div>メール</div>
					<div>
						<input name="userEmail" type="email">
					</div>
				</div>
				<div>
					<h4>郵便番号</h4>
					<div>
						<button type="button" id="addr-popup">住所検索</button>
						<br>
						<div>郵便番号</div>
						<input name="userAddrN" id="addrNum"
							readonly="readonly"><br> <div>都道府県</div> <input
							name="userAddrP" id="addrPrefecture" readonly="readonly"><br>
						<div>市区町村</div> <input name="userAddrC" id="addrCity" readonly="readonly"><br>
						<div>詳細情報</div> <input name="userAddrD">
					</div>
				</div>
				<div>
					プロフィールイメージ <br> <input type="file" name="userImg">
				</div>
				<hr>
				<div>
					<button>Sign Up</button>
				</div>
			</div>
	</form>
</body>
</html>