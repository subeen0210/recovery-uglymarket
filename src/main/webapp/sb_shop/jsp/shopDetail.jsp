<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/shopDetail.js"></script>
<link rel="stylesheet" href="wj/css/itemDetail.css">
<title>Insert title here</title>
</head>
<body>

	<h3>shop detail</h3>

	<div>
		<div>
			<img alt="" src="">
			<span>${item.i_img }</span>
		</div>
		<div>
			<span>${item.i_name }</span>
		</div>
		<div>
			<span>${item.i_price }</span>
		</div>
		<div>
			<span>무료배송</span>
		</div>
		<div>
			<span>${item.i_des }</span>
		</div>
		
		<div class="quantity-container">
        	<button class="quantity-button" onclick="decrementQuantity()">-</button>
        	<input type="text" class="quantity-input" id="quantityInput" value="1" readonly>
        	<button class="quantity-button" onclick="incrementQuantity()">+</button>
    	</div>
    	<button>장바구니</button>
    	<button>바로구매</button>
	</div>

</body>
</html>