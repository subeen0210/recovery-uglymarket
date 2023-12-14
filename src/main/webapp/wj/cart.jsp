<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="wj/css/cart.css" />
</head>
<body>
	<div class="cart-container">
		<div class="cart-title">カート</div>
		<br />
		<div>
			<div class="cart-menu">
				<div>db넘버</div>
				<div class="cart-name">商品名</div>
				<div>価格</div>
				<div>数量</div>
				<div>削除&ensp;/&ensp;変更</div>
			</div>
			<div>
			<c:forEach var="cart" items="${carts }">
			<div class="cart-item">
				<div>${cart.c_no }</div>
				<div class="item-img">
					<img src="" alt="" />${cart.i_img }
				</div>
				<div class="item-category">${cart.i_category }</div>
				<div>${cart.i_name }</div>
				<div>${cart.i_price }円</div>
				<div class="quantity-container">
					<button class="quantity-button" onclick="increaseQuantity()">
						+</button>
					<input type="text" class="quantity-input" id="quantityInput"
						value="${cart.c_number }" readonly />
					<button class="quantity-button" onclick="decreaseQuantity()">
						-</button>
				</div>
				<div>
					<button>削除</button>
					<button>変更</button>
				</div>
			</div>
			</c:forEach>
			</div>
			<br />
			<div class="cart-Pay">
				<div class="pay-set">決済する</div>
			</div>
		</div>
	</div>
	<div class="cart-result">
		<div>
			総額<br />${priceAll }円
		</div>
		<div>+</div>
		<div>
			送料<br />0円
		</div>
		<div>=</div>
		<div>
			総決済金額<br />${priceAll }円
		</div>
	</div>
	<br><br><br>	
</body>
<script src="wj/js/cart.js"></script>
</html>
