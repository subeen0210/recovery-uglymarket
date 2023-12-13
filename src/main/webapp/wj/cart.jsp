<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="css/cart.css">
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

			<div class="cart-item">
				<div>db넘버</div>
				<div class="item-img">
					<img src="" alt="" />이미지 넣어!
				</div>
				<div class="item-category">ふつう</div>
				<div>シャインマスカット 2kg</div>
				<div>23,900円</div>
				<div class="quantity-container">
					<button class="quantity-button" onclick="increaseQuantity()">
						+</button>
					<input type="text" class="quantity-input" id="quantityInput"
						value="1" readonly />
					<button class="quantity-button" onclick="decreaseQuantity()">
						-</button>
				</div>
				<div>
					<button>削除</button>
					<button>変更</button>
				</div>
			</div>
			<br />
			<div class="cart-Pay">
				<div class="pay-set">決済する</div>
			</div>
		</div>
	</div>
	<div class="cart-result">
		<div>
			総額<br />6860円
		</div>
		<div>+</div>
		<div>
			送料<br />0円
		</div>
		<div>=</div>
		<div>
			総決済金額<br />6860円
		</div>
	</div>
	<br><br><br>
</body>
<script src="wj/js/cart.js"></script>
</html>
