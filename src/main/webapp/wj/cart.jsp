<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="wj/css/cart.css" />
</head>
<body>
	<div class="main">
		<div class="main-title">
			<div class="title">カート</div><br>
			<div>
				<!-- 삭제 버튼 -->
				<button class="btn-del">選択削除</button>
			</div>
		</div>
		<br />
		<!-- 전체 선택 체크박스 -->
		<label class="check-label" for="selectAll"><input
			type="checkbox" id="selectAll" />&ensp;全部選択する</label> <br />
		<c:forEach var="cart" items="${carts }" varStatus="loopStatus">
		<c:set var="i" value="${loopStatus.index + 1}" />
		<div class="menu" id="itemList">
			<div class="menu-num">
				<input type="checkbox" class="item-checkbox" />&ensp;${i}
			</div>
			<div class="menu-profile">
				<div class="profile-img">${cart.i_img }</div>
			</div>
			<div class="menu-info">
				<div class="info-title">${cart.i_name }</div>
				<br />
				<div class="info-menus">
					<div class="info-menu">${cart.i_category}</div>
					&emsp;
					<div>${cart.f_name }</div>
				</div>
				<br />
				<div class="info-delivery">送料無料</div>
				<br />
				<div class="info-price">${cart.i_price }</div>
			</div>
			<div class="menu-set">
				<div class="set-quanity">
					<div class="quantity-container">
						&ensp;
						<button class="quantity-button" onclick="increaseQuantity()">
							&ensp;+</button>
						<input type="text" class="quantity-input" id="quantityInput"
							value="${cart.c_number }" readonly />
						<button class="quantity-button" onclick="decreaseQuantity()">
							-</button>
					</div>
				</div>
				<br />
				<div class="set-allprice">小計&ensp;:&ensp;${cart.i_price * cart.c_number }</div>
				<br />
				<div><button>削除</button></div>
			</div>
		</div>
		<br>
		<br>
		</c:forEach>
		<br />
		<div class="pay">
			<div class="pay-allmoney">商品合計 : ${priceAll }</div>
			<div class="pay-click">
				<a class="pay-a" href="">決済する</a>
			</div>
		</div>
	</div>
</body>
<script src="wj/js/cart(copy).js"></script>
</html>
