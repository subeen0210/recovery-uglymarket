<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/addr.js"></script>
<script type="text/javascript" src="js/idCheck.js"></script>
</head>
<body>
	<form action="RegSellerC" method="post" enctype="multipart/form-data">
		<div>
			<div>
				<h1>회원가입</h1>
			</div>
			<div>
				<div>ID</div>
				<div>
					<input name="sellerID" id="ID" maxlength="20">
					<button type="button" id="checkDuplicate" value="seller">重複確認</button>
					<span id="idStatus"></span>
				</div>
			</div>
			<div>
				<div>パスワード</div>
				<div>
					<input name="sellerPW" type="password" id="sellerPW" maxlength="20">
					<span id="pwStatus"></span> 
					<input type="password" id="sellerPWconfirm" placeholder="もう一度記入してください">
					<span id="pwConfirm"></span>
				</div>
			</div>
			<div>
				<div>お名前</div>
				<div>
					姓<input name="sellerKanji_ln">
				</div>
				<div>
					名<input name="sellerKanji_fn">
				</div>
				<div>
					セイ<input name="sellerKata_ln">
				</div>
				<div>
					メイ<input name="sellerKata_fn">
				</div>
			</div>
			<div>
				<div>電話番号</div>
				<div>
					<input name="sellerTel1">-<input name="sellerTel2">-<input
						name="sellerTel3">
				</div>
			</div>
			<div>
				農場イメージ <br> <input type="file" name="farmImg">
			</div>
			<div>
				<div>農場名</div>
				<div>
					<input name="farmName">
				</div>
			</div>
			<div>
				<div>農場説明</div>
				<div>
					<textarea name="farmStory"></textarea>
				</div>
			</div>
			<div>
				<h4>農場 郵便番号</h4>
				<div>
					<button type="button" id="addr-popup">住所検索</button>
					<br> 郵便番号 <input name="sellerAddrN" id="addrNum" readonly="readonly">
					<br> 都道府県 <input name="sellerAddrP" id="addrPrefecture" readonly="readonly">
					<br> 市区町村 <input name="sellerAddrC" id="addrCity" readonly="readonly">
					<br> 詳細情報 <input name="sellerAddrD">
				</div>
			</div>
			<hr>
			<div>
				<button>Sign Up</button>
			</div>
		</div>
	</form>
</body>
</html>