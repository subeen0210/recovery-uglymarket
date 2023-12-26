<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-3.7.1.js"></script> -->
<script src="js/localStorage.js"></script>
<link rel="stylesheet" href="orderPage.css">
</head>
<body>
	<form action="OrderPageC" method="post">
	<div id="order-container">
		<details>
			<summary>配送先</summary>
			<div>
				<div>${addr.a_name }</div>
				<div>${addr.a_tel }</div>
				<div>${addr.a_addr }${addr.a_addrDetail } (${addr.a_postcode })</div>
			</div>
			<div>
				<div>配送時間帯を設定</div>
				<select id="cars" name="cars">
					<!-- option 태그로 각 선택 옵션을 정의 -->
					<option value="8">午前中(8:00~12:00)</option>
					<option value="12">12:00~14:00</option>
					<option value="14">14:00~16:00</option>
					<option value="16">16:00~:18:00</option>
					<option value="18">18:00~20:00</option>
					<option value="19">19:00~21:00</option>
				</select>
			</div>
		</details>
		<details>
			<summary>商品目録</summary>
			<div id="getItems"></div>
			<div id="totalPrice"></div>
		</details>
		<button>決済</button>
	</div>
	</form>
</body>
</html>