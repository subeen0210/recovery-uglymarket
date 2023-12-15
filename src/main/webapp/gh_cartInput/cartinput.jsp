<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="css/cart.css" />
  </head>
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
      <c:forEach var="cart" items="${carts }">
      <div class="menu" id="itemList">
        <div class="menu-profile">
          <div class="profile-name">
            농장명 넣어!&ensp;<input type="checkbox" class="item-checkbox" />
          </div>
          <div class="profile-img">${cart.i_img }</div>
        </div>
        <div class="menu-info">
          <div class="info-title">${cart.i_name }</div>
          <br />
          <div class="info-delivery">무료배송</div>
          <br />
          <div class="info-price">${cart.i_price }</div>
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
      <br>
      </c:forEach>
      <br />
      <div class="pay">
        <div class="pay-allmoney">${priceAll }</div>
        <div class="pay-click"><a class="pay-a" href="">決済する</a></div>
      </div>
    </div>
  </body>
  <script src="js/cart.js"></script>
</html>
