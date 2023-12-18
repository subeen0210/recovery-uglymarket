<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="wj/css/itemDetail.css" />
<script type="text/javascript" src="js/shopDetail.js"></script>
</head>
<body>
	<div class="item-detail-kwj">
		<div class="item-img" style="background-image: url('itemFolder/${item.i_img }');"></div>
		<div class="item-content">
			<c:choose>
				<c:when test="${item.i_category == 1 }">
					<div class="item-category1">アグリー</div>
					<br />
				</c:when>
				<c:when test="${item.i_category == 2 }">
					<div class="item-category2">ふつう</div>
					<br />
				</c:when>
			</c:choose>
			<div class="item-title">${item.i_name }</div>
			<br />
			<div class="item-price">${item.i_price }</div>
			<br />
		<%--<div class="item-delivery">배송비 유무</div>
			<br /> --%>
			<div class="item-select">
				<span style="font-weight: bold; font-size: 12pt">数量</span> &emsp;&emsp;
					<button id="decrement" class="quantity-button" onclick="incrementQuantity()">+</button>
					<input type="text" class="quantity-input" id="quantityInput" value="1" readonly>
					<button id="increment" class="quantity-button" onclick="decrementQuantity()">-</button>
			</div>
			<br />
			<div class="item-click">
				<div class="click1" onclick="goToCart('${item.i_no }','${sessionScope.userAccount.u_id}')">カート</div>&emsp;
				<div class="click2">直払い</div>
			</div>
		</div>
	</div>

	<div class="item-explain">
		<div class="explain-title">商品説明</div>
		<br /> <br />
		<div class="explain-input">${item.i_des }</div>
	</div>
	<br><br>
	<div class="item-review">
		<div class="review-title">
			<div class="review-text">レビュー</div>
			<div id="star-rating">
				<div class="star" data-value="5">&#9733;</div>
				<div class="star" data-value="4">&#9733;</div>
				<div class="star" data-value="3">&#9733;</div>
				<div class="star" data-value="2">&#9733;</div>
				<div class="star" data-value="1">&#9733;</div>
				&emsp;
				<div>
					<p id="selected-rating">
						Star Rating : <span id="rating-value">0</span>点
					</p>
				</div>
			</div>
		</div>
		<br />
		<br />
		<div class="review-input">
			<div class="input-text">db넣어!</div>
			<div class="input-menu">
				<div id="usernameDisplay"></div>
				<div>
					<button class="review-button">コメント</button>
				</div>
			</div>
		</div>
	</div>
	<br />
	<div class="review-view">
		<div>
			<a class="view-more" href="">もっと見る</a>
		</div>
	</div>
	<br />
</body>
<script src="wj/js/itemDetail.js"></script>
</html>
