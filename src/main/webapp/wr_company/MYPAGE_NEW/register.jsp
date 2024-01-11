<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="wr_company/MYPAGE_NEW/css/seller_register.css">
<link rel="stylesheet" href="wr_company/MYPAGE_NEW/css/index.css">
<script
      type="text/javascript"
      src="wr_company/MYPAGE_NEW/js/register.js"
    ></script>
</head>
<body>

<div class="content" id="product-registration">
        <h2>商品を登録してください</h2>

   <form id="addForm" action="ItemAddC" method="post" enctype="multipart/form-data">
		<div>
			<div>
				<div>商品名</div>
				<div>
					<input name="name" class="name" placeholder="商品名を入力ください。">
				</div>
			</div>
			<div>
			<div>商品の説明</div>
				<div>
					<textarea cols="50" rows="10" class="story" name="story" placeholder="商品の説明を入力ください。(500字以内)"></textarea>
				</div>
			</div>
			<div>
				<div class="radio-container">商品種類
				<label style="cursor: pointer;">アグリー<input checked="checked" type="radio" value="1" name="type"class="select"></label> 
				<label style="cursor: pointer;">普通<input type="radio" value="2" name="type" class="select"></label>
				</div>
			</div>
			<div>
				<div>賞味期限</div>
				<div>
					<input name="enddate" type="date" class="date" placeholder="賞味期限">
				</div>
			</div>
			<div>
				<div>商品在郷</div>
				<div>
					<input name="stock" class="stock" placeholder="商品の在庫を入力ください。">
				</div>
			</div>
			<div>
				<div>商品価格</div>
				<div>
					<input name="price" class="price" placeholder="数字だけ入力ください。">
				</div>
			</div>
			<div>
				<div class="photo-area">
				<div>写真登録</div>
				<div class="photo-text">写真は一枚必須で、最大四枚まで可能です。</div>
				</div>
				<div>
					<input type="file" name="img" class="img" multiple>
				</div>
			</div>
				<button style="
	width: 70px;
	height: 50px;
	background-color: #5dc41a;
	color: white;
	
	border: none;
	cursor: pointer;" type="button" onclick="itemAdd()">登録</button>
		</div>
			<div id="registrationMessage"></div>
		</form>
           	
    </div>
</body>
</html>