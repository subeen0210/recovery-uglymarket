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
			<div class="title">カート</div>
			<div>
				<!-- 삭제 버튼 -->
				<button class="btn-del" onclick="deleteSelected()">選択削除</button>
			</div>
		</div>
		<br />
		<!-- 전체 선택 체크박스 -->
		<label class="check-label" for="selectAll"><input
			type="checkbox" id="selectAll" />&ensp;全部選択する</label> <br />
		<div class="menu" id="itemList">
			<div class="menu-num">
				<input type="checkbox" class="item-checkbox" />&ensp;넘버
			</div>
			<div class="menu-profile">
				<div class="profile-img">이미지 넣어!</div>
			</div>
			<div class="menu-info">
				<div class="info-title">상품 제목 넣어!</div>
				<br />
				<div class="info-menus">
					<div class="info-menu">못난이</div>
					&emsp;
					<div>농장명 넣어!</div>
				</div>
				<br />
				<div class="info-delivery">送料無料</div>
				<br />
				<div class="info-price">상품가격 넣어!</div>
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
				<div class="set-allprice">小計</div>
				<br />
				<div class="set-del">削除</div>
			</div>
		</div>
		<br />
		<div class="pay">
			<div class="pay-allmoney">商品合計 :</div>
			<div class="pay-click">
				<a class="pay-a" href="">決済する</a>
			</div>
		</div>
	</div>
</body>
<script src="wj/js/cart(copy).js"></script>
</html>
