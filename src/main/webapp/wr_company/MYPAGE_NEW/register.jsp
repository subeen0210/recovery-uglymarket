<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="wr_company/MYPAGE_NEW/css/seller_register.css">
<link rel="stylesheet" href="wr_company/MYPAGE_NEW/css/header.css">
<script type="text/javascript" src="wr_company/MYPAGE_NEW/js/register.js"></script>
</head>
<body>

<div class="content" id="product-registration">
        <h2>商品を登録してください</h2>

   <form id="addForm" action="ItemAddC" method="post" enctype="multipart/form-data">
		<div>
			<div>
				<div>商品名</div>
				<div>
					<input name="name" class="name">
				</div>
			</div>
			<div>
			<div>商品の説明</div>
				<div>
					<textarea class="story" name="story"></textarea>
				</div>
			</div>
			<div>
				<div class="radio-container">商品種類
				<label>アグリー<input type="radio" value="1" name="type"class="select"></label> 
				<label>普通<input type="radio" value="2" name="type" class="select"></label>
				</div>
			</div>
			<div>
				<div>賞味期限</div>
				<div>
					<input name="enddate" type="date" class="date">
				</div>
			</div>
			<div>
				<div>商品在郷</div>
				<div>
					<input name="stock" class="stock">
				</div>
			</div>
			<div>
				<div>商品価格</div>
				<div>
					<input name="price" class="price">
				</div>
			</div>
			<div>
				<div>写真登録</div>
				<div>
					<input type="file" name="img" class="img" multiple>
				</div>
			</div>
				<button type="button" onclick="itemAdd()">登録</button>
		</div>
			<div id="registrationMessage"></div>
		</form>
           	
    </div>
</body>
</html>