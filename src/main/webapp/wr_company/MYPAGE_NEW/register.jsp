<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="wr_company/js/seller_register3.js"></script>
<link rel="stylesheet" href="css/seller_register3.css">
<link rel="stylesheet" href="css/header.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content" id="product-registration">
        <h2>상품 등록</h2>

    <form action="ItemAddC" method="post" enctype="multipart/form-data">
	<div>
		<div>
			<div>상품명</div>
			<div><input name="name" class="name"></div>
		</div>
		<div>
			<div>상품 설명</div>
			<div><textarea class="story" name="story"></textarea></div>
		</div>
		<div>
			<div class="radio-container">상품 종류
			
				<label>못난이<input type="radio" value="1" name="type" class="select"></label>
				<label>일반<input type="radio" value="2" name="type" class="select"></label>
			
			</div>
		</div>
		<div>
			<div>유통기한</div>
			<div><input name="enddate" type="date" class="date"></div>
		</div>
		<div>
			<div>상품 재고</div>
			<div><input name="stock" class="stock"></div>
		</div>
		<div>
			<div>상품 가격</div>
			<div><input name="price"  class="price"></div>
		</div>
		<div>
			<div>사진 등록</div>
			<div><input type="file" name="img" class="img"></div>
			<div><input type="file" name="img2" class="img"></div>
			<div><input type="file" name="img3" class="img"></div>
			<div><input type="file" name="img4" class="img"></div>
		</div>
		   <button type="submit">등록</button>
	</div>
	</form>

           	
    </div>
</body>
</html>