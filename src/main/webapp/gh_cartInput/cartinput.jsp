<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="/src/main/webapp/css/cart.css" />
  </head>
  <!-- 
	상품 id 번호를 받아와서 장바구니에 추가.
	상품 선택한 갯수도 받아서 c_number에 추가.
	로그인이 안되어있다면 로그인 창으로 안내
	로그인 세션이 만료했다면 다시 로그인 창으로 안내
	insert into cart values(cart_seq.nextval, u_id, i_no, c_number);
	
	 -->
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
      <label class="check-label" for="selectAll"
        >全部選択する&ensp;<input type="checkbox" id="selectAll"
      /></label>
      <br />
      <div class="menu" id="itemList">
        <div class="menu-profile">
          <div class="profile-name">
            농장명 넣어!&ensp;<input type="checkbox" class="item-checkbox" />
          </div>
          <div class="profile-img">이미지 넣어!</div>
        </div>
        <div class="menu-info">
          <div class="info-title">상품 제목 넣어!</div>
          <br />
          <div class="info-delivery">무료배송</div>
          <br />
          <div class="info-price">상품가격 넣어!</div>
        </div>
        <div class="menu-set">
          <div class="set-quanity">
            <div class="quantity-container">
                &ensp;
              <button class="quantity-button" onclick="increaseQuantity()">
                +
              </button>
              <input
                type="text"
                class="quantity-input"
                id="quantityInput"
                value="${cart.c_number }"
                readonly
              />
              <button class="quantity-button" onclick="decreaseQuantity()">
                -
              </button>
            </div>
          </div>
          <br />
          <div class="set-del">削除</div>
        </div>
      </div>
      <br />
      <div class="pay">
        <div class="pay-allmoney">총금액 넣어!</div>
        <div class="pay-click"><a class="pay-a" href="">決済する</a></div>
      </div>
    </div>
  </body>
  <script src="js/cart.js"></script>
</html>
