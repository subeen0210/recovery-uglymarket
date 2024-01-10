<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script
      src="https://code.jquery.com/jquery-3.7.0.js"
      integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
      crossorigin="anonymous"
    ></script>
    <script src="wr_company/MYPAGE_NEW/js/mypage.js?ver=1.1"></script>
    <link rel="stylesheet" href="wr_company/MYPAGE_NEW/css/myPage.css" />
    <meta charset="UTF-8" />
    <title>アグリーマーケット販売用サイト</title>
  </head>
  <body>
    <div class="myPage_container">
      <div class="welcome_comment">
        <div class="welcome">
          ${sessionScope.sellerAccount.s_Fname }の マイページへようこそ。
        </div>
        <div class="main_menu_container">
          <div class="main_menu_control">
            <div class="main_menu" id="registerMenu">
              <a class="menu-link" data-page-id="register">商品管理</a>
            </div>
            <div class="main_menu" id="deliveryMenu">
              <a class="menu-link" data-page-id="delivery">配送管理</a>
            </div>
            <div class="main_menu" id="stockMenu">
              <a class="menu-link" data-page-id="stock">在庫管理</a>
            </div>

            <div class="main_menu" id="mypageMenu">
              <a class="menu-link" data-page-id="mypage">農場情報管理</a>
            </div>
          </div>
        </div>
        <div class="sub_control">
          <div class="subview">
            <div class="jsp_view"></div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
