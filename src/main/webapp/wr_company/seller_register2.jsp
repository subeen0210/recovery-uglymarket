<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="css/seller_register.css">
<link rel="stylesheet" href="css/header.css">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>

	<div class="seller_container">
		<!-- 상단 탭 메뉴 -->
		<div class="tabs">
			<div class="tab active" onclick="showContent('product-registration')">상품
				등록</div>
			<div class="tab" onclick="showContent('product-management')">상품
				관리</div>
			<div class="tab" onclick="showContent('shipping-management')">배송
				관리</div>
		</div>

		<!-- 내용 표시 부분 -->
		<div class="content" id="product-registration">
			<!-- 상품 등록 내용 -->
			<h2>상품 등록</h2>
			<form id="productForm" onsubmit="submitForm(); return false;">

				<label for="productName">상품 종류:</label>
				<div class="product_reg">

					<select name="category" class="product_reg">
						<option value="motnane">못난이</option>
						<option value="normal">일반</option>
					</select>
				</div>
				<br> <label for="productName">상품 이름:</label> <input
					class="input" type="text" id="productName" name="productName"
					required><br> <label for="price">가 격:</label> <input
					class="input" type="number" id="price" name="price" required><br>

				<label for="stock">재고량:</label> <input class="input" type="number"
					id="stock" name="stock" required><br> <label for="ed">유통기한</label>
				<input class="input" type="date" id="ed" name="ed" required><br>
				<label for="des">상품설명</label> <input class="input" type="text"
					id="des" name="des" required><br> <label for="img">대표이미지</label>
				<input class="input" type="file" id="img" name="img" required><br>
				<label for="img2">이미지2:</label> <input class="input" type="file"
					id="img2" name="img2" required><br> <label for="img3">이미지3:</label>
				<input class="input" type="file" id="img3" name="img3" required><br>
				<label for="img4">이미지4:</label> <input class="input" type="file"
					id="img4" name="img4" required><br>

				<!-- 기타 필요한 상품 정보를 추가할 수 있습니다. -->

				<input type="submit" value="등록">
			</form>
		</div>
		
<div class="content" id="product-management" style="display: none;">
		<!-- 배송 관리 내용 -->
		<h2>상품 관리 </h2>
		<p>This is the content for product management.</p>
	</div>
	








	<div class="content" id="shipping-management" style="display: none;">
		<!-- 배송 관리 내용 -->
		<h2>배송 관리</h2>
		<p>This is the content for shipping management.</p>
	</div>
</div>

	<script>
		function showContent(contentId) {
			// Hide all content divs
			document.querySelectorAll('.content').forEach(function(content) {
				content.style.display = 'none';
			});

			// Deactivate all tabs
			document.querySelectorAll('.tab').forEach(function(tab) {
				tab.classList.remove('active');
			});

			// Show the selected content
			document.getElementById(contentId).style.display = 'block';

			// Activate the corresponding tab
			document
					.querySelector(`.tab[onclick="showContent('${contentId}')"]`).classList
					.add('active');
		}
	</script>

</body>
</html>
