<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>add Item</h2>
	
	<form action="AddItemC" method="post" enctype="multipart/form-data">
	<div>
		<div>
			<div>상품명</div>
			<div><input name="name"></div>
		</div>
		<div>
			<div>상품 설명</div>
			<div><input name="story"></div>
		</div>
		<div>
			<div>상품 종류</div>
			<div>
				<label>못난이<input type="radio" value="1" name="type"></label>
				<label>일반<input type="radio" value="2" name="type"></label>
			</div>
		</div>
		<div>
			<div>유통기한</div>
			<div><input name="enddate"></div>
		</div>
		<div>
			<div>상품 재고</div>
			<div><input name="stock"></div>
		</div>
		<div>
			<div>사진 등록</div>
			<div><input type="file" name="img"></div>
		</div>
	</div>
	</form>
	
	

</body>
</html>