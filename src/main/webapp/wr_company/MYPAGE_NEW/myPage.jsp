<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="wr_company/MYPAGE_NEW/js/mypage.js"></script>
<link rel="stylesheet" href="wr_company/MYPAGE_NEW/css/myPage.css">
<link rel="stylesheet" href="wr_company/MYPAGE_NEW/css/header.css">

<meta charset="UTF-8">
<title>アグリーマーケット販売用サイト</title>
</head>
<body>
	<div class="myPage_container">

	 	<div class="seller_id_main">

			<div class="seller_id">オタクの農場</div>
		</div>

		<div class="main_menu_container">
			<div class="main_menu_control">
				<div class="main_menu" id="registerMenu">
					<a onclick="showJSP('register') ">商品管理</a>
				</div>
				<div class="main_menu" id="deliveryMenu">
					<a onclick="showJSP('delivery')">配送管理</a>
				</div>
				<div class="main_menu" id="stockMenu">
					<a onclick="showJSP('stock')">在庫管理</a>
				</div>

				<div class="main_menu" id="mypageMenu">
					<a onclick="showJSP('mypage')">農場情報管理</a>
				</div>

			</div>
		</div>
		<div class="sub_control">

			<div class="subview">
				<div class="jsp_view"></div>
			</div>

		</div>
	</div>

</body>
</html>