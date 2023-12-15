<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="wr_company/js/seller_register3.js"></script>
<link rel="stylesheet" href="css/seller_register.css">
<link rel="stylesheet" href="css/header.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="content" id="product-registration">
        <h2>商品を登録してください</h2>

    <form action="ItemAddC" method="post" enctype="multipart/form-data">
	<div>
		<div>
			<div>商品名</div>
			<div><input name="name" class="name"></div>
		</div>
		<div>
			<div>商品の説明</div>
			<div><textarea class="story" name="story"></textarea></div>
		</div>
		<div>
			<div class="radio-container">商品種類
			
				<label>アグリー<input type="radio" value="1" name="type" class="select"></label>
				<label>ふつう<input type="radio" value="2" name="type" class="select"></label>
			
			</div>
		</div>
		<div>
			<div>賞味期限</div>
			<div><input name="enddate" type="date" class="date"></div>
		</div>
		<div>
			<div>商品在郷</div>
			<div><input name="stock" class="stock"></div>
		</div>
		<div>
			<div>商品価格</div>
			<div><input name="price"  class="price"></div>
		</div>
		<div>
			<div>写真登録（一番目の写真が代表イメージになります。）</div>
			<div><input type="file" name="img" class="img"></div>
			<div><input type="file" name="img2" class="img"></div>
			<div><input type="file" name="img3" class="img"></div>
			<div><input type="file" name="img4" class="img"></div>
		</div>
		   <button type="submit">登録</button>
	</div>
	</form>

           	
    </div>
</body>
</html>