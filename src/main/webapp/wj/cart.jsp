<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="wj/css/cart.css" />
</head>
<body>
	<div class="main">
		<div class="main-title">
			<div class="title">カート</div><br>
			<div>
				<!-- 삭제 버튼 -->
				<button class="btn-del" onclick="deleteSelectCart()">選択削除</button>
			</div>
		</div>
		<br />
		<!-- 전체 선택 체크박스 -->
		<label class="check-label" for="checkAll"><input
			type="checkbox" id="checkAll" />&ensp;全部選択する</label> <br />
		<c:forEach var="cart" items="${carts }" varStatus="loopStatus">
		<c:set var="i" value="${loopStatus.index + 1}" />
		<div class="menu ${cart.c_no }" id="itemList">
			<div class="menu-num">
				<input data-cartCode="${cart.c_no}" type="checkbox" class="item-checkbox" onchange="selectTotalPrice(this)"/>&ensp;${i}
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
						<button class="quantity-button" onclick="adjustQuantity(this,${cart.c_no},1)">
							+</button>
						<input type="text" class="quantity-input" id="quantityInput_${cart.c_no}"
							value="${cart.c_number }" data-cartCode="${cart.c_no}"/>
						<button class="quantity-button" onclick="adjustQuantity(this,${cart.c_no},-1)">
							-</button>
					</div>
				</div>
				<br />
				<div class="set-allprice" id="set-allprice2_${cart.c_no }"
						 data-subtotal="${cart.i_price * cart.c_number}">
						 小計&ensp;:&ensp;
					 <span class="per-total-price" id="set-allprice_${cart.c_no }" >${cart.i_price * cart.c_number }<img style="width: 12px;" alt="" src="img/en-icon.png"></span></div>
				<br />
				<div class="quantity-btn"><button class="change_quantity" onclick="changeQuantity(${cart.c_no})">変更</button>&ensp;<button onclick="deleteCart(${cart.c_no })">削除</button></div>
			</div>
		<input type="hidden" class="cartNumber" value="${cart.c_no }">
		<input type="hidden" class="itemNumber" value="${cart.i_no }">
		</div>
		<br class="${cart.c_no }">
		<br class="${cart.c_no }">
		</c:forEach>
		<br />
		<div class="pay">
			<div class="pay-allmoney">商品合計 : <span id="payAllMoneySpan"></span></div>
			<div class="pay-click">
				<button class="button btnPush btnBlueGreen" onclick="payStorage()">決済する</button>
			</div>
		</div>
	</div>
</body>
<script src="wj/js/cart(copy).js"></script>
<script src="js/localStorage.js"></script>
</html>
