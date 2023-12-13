<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="wj/css/itemDetail.css" />
</head>
<body>
	<div class="item-detail-kwj">
		<div class="item-img">이미지 넣어!</div>
		<div class="item-content">
			<div class="item-category">못난이</div>
			<br />
			<div class="item-title">타이틀 넣어!</div>
			<br />
			<div class="item-title">가격 넣어!</div>
			<br />
			<div class="item-delivery">배송비 유무</div>
			<br />
			<div class="item-select">
				<span style="font-weight: bold; font-size: 12pt">数量</span> &emsp; <input
					type="text" id="quantity" value="db값" readonly />&emsp;
				<button id="increment">+</button>
				<button id="decrement">-</button>
			</div>
			<br /> <br />
			<div class="item-click">
				<div class="click1">カート</div>
				<div class="click2">直払い</div>
			</div>
		</div>
	</div>

	<div class="item-explain">
		<div class="explain-title">商品説明</div>
		<br /> <br />
		<div class="explain-input">DB 넣어!</div>
	</div>

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
