<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<form action="RegUserAccountC" method="post" enctype="multipart/form-data">
	<div>
		<div>
			<h1>회원가입</h1>
		</div>
		<div>
			<div>ID</div>
			<div>
				<input name="userID">중복확인
			</div>
		</div>
		<div>
			<div>パスワード</div>
			<div>
				<input name="userPW" type="password"> <br>
				<input type="password" placeholder="もう一度記入してください">
			</div>
		</div>
		<div>
			<div>お名前</div>
			<div>
				姓<input name="userKanji_ln">
			</div>
			<div>
				名<input name="userKanji_fn">
			</div>
			<div>
				セイ<input name="userKata_ln">
			</div>
			<div>
				メイ<input name="userKata_fn">
			</div>
		</div>
		<div>
			<div>ニックネーム</div>
			<div>
				<input name="userNicname">
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
				<button id="addrUser-popup">住所検索</button>
				<br>
				郵便番号 <input name="userAddrN" id="addrNum" readonly="readonly"><br> 
				都道府県 <input name="userAddrP" id="addrPrefecture" readonly="readonly"><br> 
				市区町村 <input name="userAddrC" id="addrCity" readonly="readonly"><br>
				詳細情報 <input name="userAddrD">
			</div>
		</div>
		<div>
		プロフィールイメージ <br>
		<input type="file" name="userImg">
		</div>
		<hr>
		<div>
			<button>Sign Up</button>
		</div>
	</div>
	</form>
</body>
</html>