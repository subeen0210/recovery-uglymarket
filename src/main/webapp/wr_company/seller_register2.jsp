<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }

    .container {
     display: flex;
    flex-direction: column;
    align-content: flex-start;
    flex-wrap: wrap;
    top: 10px;
    left: 10px;
    }

    .tabs {
      display: flex;
      background-color: #f1f1f1;
      margin-left: 50px;
    }

    .tab {
      cursor: pointer;
      padding: 15px;
      flex-grow: 1;
      text-align: center;
      border-bottom: 2px solid transparent;
    }

    .tab:hover {
      background-color: #ddd;
    }

    .tab.active {
      background-color: #ccc;
      border-bottom: 2px solid #333;
    }

    .content {
      padding: 15px;
    }

    .content h2 {
      color: #333;
    }
  </style>
</head>
<body>

<div class="container">
  <!-- 상단 탭 메뉴 -->
  <div class="tabs">
    <div class="tab active" onclick="showContent('product-registration')">상품 등록</div>
    <div class="tab" onclick="showContent('product-management')">상품 관리</div>
    <div class="tab" onclick="showContent('shipping-management')">배송 관리</div>
  </div>

  <!-- 내용 표시 부분 -->
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
</div>
  <div class="content" id="product-management" style="display: none;">
    <!-- 상품 관리 내용 -->
    <h2>상품 관리</h2>
     
    

  <div class="content" id="shipping-management" style="display: none;">
    <!-- 배송 관리 내용 -->
    <h2>배송 관리</h2>
    <p>This is the content for shipping management.</p>
  </div>
</div>

<script>
  function showContent(contentId) {
    // Hide all content divs
    document.querySelectorAll('.content').forEach(function (content) {
      content.style.display = 'none';
    });

    // Deactivate all tabs
    document.querySelectorAll('.tab').forEach(function (tab) {
      tab.classList.remove('active');
    });

    // Show the selected content
    document.getElementById(contentId).style.display = 'block';

    // Activate the corresponding tab
    document.querySelector(`.tab[onclick="showContent('${contentId}')"]`).classList.add('active');
  }
</script>

</body>
</html>
