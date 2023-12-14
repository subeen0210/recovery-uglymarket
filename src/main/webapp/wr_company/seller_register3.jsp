<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 및 배송 관리</title>
<link rel="stylesheet" href="wr_company/css/seller_register3.css">
<link rel="stylesheet" href="css/header.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="tabs">
        <div class="tab" onclick="showContent('product-registration')">상품 등록</div>
        <div class="tab" onclick="showContent('product-management')">상품 관리</div>
    </div>

    <div class="content" id="product-registration">
        <h2>상품 등록</h2>

    <form action="../sb_mypage/jsp/AddItemC" method="post" enctype="multipart/form-data">
	<div>
		<div>
			<div>상품명</div>
			<div><input name="name" class="name"></div>
		</div>
		<div>
			<div>상품 설명</div>
			<div><textarea class="story" name="story"></textarea></div>
		</div>
		<div>
			<div class="radio-container">상품 종류
			
				<label>못난이<input type="radio" value="1" name="type" class="select"></label>
				<label>일반<input type="radio" value="2" name="type" class="select"></label>
			
			</div>
		</div>
		<div>
			<div>유통기한</div>
			<div><input name="enddate" type="date" class="date"></div>
		</div>
		<div>
			<div>상품 재고</div>
			<div><input name="stock" class="stock"></div>
		</div>
		<div>
			<div>상품 가격</div>
			<div><input name="price"  class="price"></div>
		</div>
		<div>
			<div>사진 등록</div>
			<div><input type="file" name="img" class="img"></div>
			<div><input type="file" name="img2" class="img"></div>
			<div><input type="file" name="img3" class="img"></div>
			<div><input type="file" name="img4" class="img"></div>
		</div>
		   <button type="submit">등록</button>
	</div>
	</form>

           	
    </div>

    <div class="content" id="product-management" style="display: none;">
        <h2>상품 관리</h2>
      

    <h2>상품리스트</h2>

    <table border="1">
        <thead>
            <tr>
                <th>상품이름</th>
                <th>재고량</th>
                <th>유통기한</th>
                <th>가격</th>
                <th>修正</th>
                <th>削除</th>
            </tr>
        </thead>
        <tbody>
         
         <c:forEach var="sellerItems" items="${sellerItems }">
         	<tr>
         		<td>${sellerItems.i_name }</td>
         		<td>${sellerItems.i_stock }</td>
         		<td>${sellerItems.i_enddate }</td>
         		<td>${sellerItems.i_price }</td>
         	</tr>
         </c:forEach>
            
        </tbody>
    </table>

    <br>

    
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
            document.querySelector(`.tab[onclick="showContent('${contentId}')"]`).classList.add('active');
        
            $.ajax({
                url: 'SellerItemC', 
                success: function(response) {
                  $('#'+contentId).html(response);
                },
                error: function(error) {
                  console.error('Error:', error);
                }
              });
        }

        function submitProductForm() {
            // 상품 등록 폼 제출 시 동작하는 함수
            // 필요에 따라 추가적인 로직을 여기에 작성하세요
            alert('상품이 등록되었습니다!');
        }
</script>


</body>
</html>