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
					<div class="item-category2">普通</div>
					<br />
				</c:when>
			</c:choose>
			<div class="item-title">${item.i_name }</div>
			<br />
			<div class="item-price">￥${item.i_price }</div>
			<br />
			<div class="item-select">
				<span style="font-size: 19pt; margin-right: 180px">数量</span> &emsp;&emsp;
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
		<div class="explain-input">
		<pre>${item.i_des }</pre>
		</div>
	</div>
	<br><br>
	<div class="item-review">
		<div class="review-title">
			<div class="review-text">後記</div>
			<div id="star-rating">
				<div class="star-ratings">
					<div class="star-ratings-fill space-x-2 text-lg">
						<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					</div>
					<div class="star-ratings-base space-x-2 text-lg">
						<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					</div>
				</div>
				<div>
					<p id="selected-rating">
					<span id="rating-value" data-rating="${gradeAvg.r_grade}">${gradeAvg.r_grade}</span>点
					</p>
				</div>
			</div>
		</div>
		<br>
		<div id="review-input" class="review-input">
		<c:forEach var="review" items="${reviews }">
			<div class="input-menu">
			<div class="usernameDisplay">作成者: ${review.r_nickname }</div>
			<div class="input-date">作成日: ${review.r_date }</div>
			<div class="input-grade">点: ${review.r_grade }</div>
			</div>
			<div class="input-text"><pre>${review.r_estimation }</pre></div>
		</c:forEach>
		</div>
	</div>
	<br />
	<br />
</body>
<script src="wj/js/itemDetail.js"></script>
</html>
