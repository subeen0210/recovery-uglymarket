<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/cart(copy).css">
</head>
<body>
	<div class="container">
		<div class="screen-togo">
			<h2>To Go Menu</h2>
			<ul class="menu-items">
				<!--    Menu Item 1    -->
				<li class="menu-item"><img src="./img/plate__french-fries.webp"
					alt="French Fries with Ketchup" class="menu-image">
					<div class="menu-item-dets">
						<p class="menu-item-heading">French Fries with Ketchup</p>
						<p class="g-price">$2.23</p>
					</div>
					<button class="add-button" data-title="French Fies with Ketchup"
						data-price="2.23">Add to Cart</button></li>
				<!--    Menu Item 2    -->
				<li class="menu-item"><img
					src="./img/plate__salmon-vegetables.webp"
					alt="Salmon and Vegetables" class="menu-image">
					<div class="menu-item-dets">
						<p class="menu-item-heading">Salmon and Vegetables</p>
						<p class="g-price">$8.99</p>
					</div>
					<button class="add-button" data-title="Salmon and Vegetables"
						data-price="8.99">Add to Cart</button></li>
				<!--    Menu Item 3    -->
				<li class="menu-item"><img
					src="./img/plate__spaghetti-meat-sauce.webp"
					alt="Spaghetti with Sauce" class="menu-image">
					<div class="menu-item-dets">
						<p class="menu-item-heading">Spaghetti with Sauce</p>
						<p class="g-price">$7.89</p>
					</div>
					<button class="add-button" data-title="Spaghetti with Sauce"
						data-price="7.89">Add to Cart</button></li>
				<!--    Menu Item 4    -->
				<li class="menu-item"><img src="./img/plate__tortellini.webp"
					alt="Tortellini" class="menu-image">
					<div class="menu-item-dets">
						<p class="menu-item-heading">Tortellini</p>
						<p class="g-price">$8.99</p>
					</div>
					<button class="add-button" data-title="Tortellini"
						data-price="8.99">Add to Cart</button></li>
				<!--    Menu Item 5    -->
				<li class="menu-item"><img
					src="./img/plate__chicken-salad.webp" alt="Chicken Salad"
					class="menu-image">
					<div class="menu-item-dets">
						<p class="menu-item-heading">Chicken Salad</p>
						<p class="g-price">$5.75</p>
					</div>
					<button class="add-button" data-title="Chicken Salad"
						data-price="5.75">Add to Cart</button></li>
			</ul>
		</div>
		<div class="screen-cart">
			<h2>Your Cart</h2>
			<!--  Cart Items -->
			<ul class="cart-items">
			</ul>

			<div class="cart-math">
				<p>Add items to cart</p>
			</div>
		</div>
	</div>
</body>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>
<script src="js/cart(copy).js"></script>
</html>