<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>쇼핑몰 상품 관리</title>
  <link rel="stylesheet" href="css/seller-register.css">
  <script src="js/seller-register.js"></script>
</head>
<body>

  <div class="container">
    <!-- 왼쪽 메뉴 -->
    <div class="menu">
      <ul>
        <li id="menu-product-registration" onclick="showContent('product-registration')">상품 등록</li>
        <li id="menu-product-management" onclick="showContent('product-management')">상품 관리</li>
        <li id="menu-shipping-management" onclick="showContent('shipping-management')">배송 관리</li>
      </ul>
    </div>

    <!-- 오른쪽 내용 -->
    <div class="content" id="product-registration">
      <!-- 상품 등록 내용 -->
      <h2>상품 등록</h2>
     <form id="productForm" onsubmit="submitForm(); return false;">
         <label for="productName">상품 종류:</label>
        <div class="product_reg">
				<select name="product_reg">
					<option value="motnane">못난이</option>
					<option value="normal">일반</option>
				</select>
			</div>
        <label for="productName">상품 이름:</label>
        <input type="text" id="productName" name="productName" required><br>

        <label for="price">가격:</label>
        <input type="number" id="price" name="price" required><br>

        <label for="stock">재고량:</label>\
        <input type="number" id="stock" name="stock" required><br>

        <!-- 기타 필요한 상품 정보를 추가할 수 있습니다. -->

        <input type="submit" value="등록">
      </form>
    </div>
    

    <div class="content" id="product-management" style="display: none;">
      <!-- 상품 관리 내용 -->
      <h2>상품 관리</h2>
      <!-- 상품 목록 및 관리 기능을 여기에 추가 -->
    </div>

    <div class="content" id="shipping-management" style="display: none;">
      <!-- 배송 관리 내용 -->
      <h2>배송 관리</h2>
      <!-- 배송 목록 및 관리 기능을 여기에 추가 -->
    </div>
  </div>
   
  
</body>
</html>
